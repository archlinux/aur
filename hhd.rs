/*
 * Handheld Daemon (HHD) integration.
 *
 * When HHD is managing TDP/GPU on this system (detected through the
 * `hhd.steamos` polkit stub), steamos-manager delegates TDP limiting and
 * GPU clock control to it, and suppresses the local power-management
 * interfaces that HHD already owns to avoid two controllers fighting
 * over the same hardware.
 *
 * This module is self-contained: the only touch points in vanilla code
 * are one early-return hook in power::tdp_limit_manager(), one in
 * gpu::gpu_performance_level_driver(), the interface gating in
 * manager::user, and the `mod hhd;` declaration in lib.rs.
 *
 * Contract with the upstream stub (src/hhd/http/steamos.py):
 *  - `hhd.steamos <sub> get` exits 0 (enabled), 1 (disabled OR any
 *    exception, including the /run/hhd/api socket not existing yet),
 *    or 2 (conflict). Exit 3 only ever comes from set operations.
 *  - On a transient exit-1 failure the stub prints "Error: ..." on
 *    stderr; a deliberate "disabled" prints a different message. We use
 *    that to tell a boot-time race apart from a real user choice.
 *  - `steamos-tdp get` prints "min max default"; `steamos-gpu get`
 *    prints "min max".
 */

use anyhow::{Result, anyhow, bail, ensure};
use async_trait::async_trait;
use std::ops::RangeInclusive;
use std::str::FromStr;
use std::sync::atomic::{AtomicU32, Ordering};
use std::time::Duration;
use tokio::process::Command;
use tokio::time::sleep;
use tracing::{debug, info, warn};

use crate::gpu::{GpuPerformanceLevel, GpuPerformanceLevelDriver, IntelPerformanceLevel};
use crate::power::TdpLimitManager;

#[derive(PartialEq, Debug)]
enum HhdStatus {
    Inactive,
    Active,
    Conflicts,
}

const HHD_CMD: &str = "hhd.steamos";

// Nombre max de tentatives avant d'abandonner et de considérer HHD comme
// inactif. Le tout premier appel, fait très tôt au démarrage de
// TdpManagerService, peut échouer alors que HHD n'a pas fini de créer
// /run/hhd/api : le stub lève alors une exception et sort avec le code 1
// en écrivant "Error: ..." sur stderr. Comme le manager choisi est figé
// pour la durée de vie du daemon, un seul échec transitoire suffisait à
// retomber sur RemoteInterfaceLimitManager pour toute la session. On
// re-tente donc à la fois les échecs de spawn ET les exit 1 transitoires
// (distingués d'un "disabled" volontaire par le préfixe stderr).
const HHD_STATUS_MAX_ATTEMPTS: u32 = 3;
const HHD_STATUS_RETRY_DELAY: Duration = Duration::from_millis(250);

fn stderr_is_transient_error(stderr: &[u8]) -> bool {
    // steamos.py écrit "Error: {e}" sur stderr pour toute exception
    // (socket absent, daemon en cours de démarrage...), et des messages
    // explicites ("TDP management disabled...") quand la fonctionnalité
    // est volontairement coupée. Seul le premier cas mérite un retry.
    String::from_utf8_lossy(stderr).trim_start().starts_with("Error:")
}

async fn get_hhd_status(subcommand: &str) -> HhdStatus {
    for attempt in 1..=HHD_STATUS_MAX_ATTEMPTS {
        let result = Command::new(HHD_CMD)
            .arg(subcommand)
            .arg("get")
            .output()
            .await;

        let transient_reason = match result {
            Ok(output) => match output.status.code() {
                Some(0) => return HhdStatus::Active,
                Some(2) => return HhdStatus::Conflicts,
                Some(1) => {
                    if stderr_is_transient_error(&output.stderr) {
                        format!(
                            "{HHD_CMD} {subcommand} get reported a transient error: {}",
                            String::from_utf8_lossy(&output.stderr).trim()
                        )
                    } else {
                        // "disabled" volontaire : inutile de re-tenter.
                        return HhdStatus::Inactive;
                    }
                }
                // Codes inattendus (255 = mauvais arguments, 126/127 =
                // problème d'environnement) ou mort par signal (None) :
                // on ne doit surtout pas les traiter comme Active, sous
                // peine de figer un manager HHD cassé pour toute la
                // session. On re-tente, puis on retombe sur le chemin
                // vanilla.
                other => format!(
                    "{HHD_CMD} {subcommand} get exited unexpectedly (code {other:?})"
                ),
            },
            Err(e) => format!("Failed to run {HHD_CMD} {subcommand} get: {e}"),
        };

        if attempt < HHD_STATUS_MAX_ATTEMPTS {
            warn!(
                "Attempt {attempt}/{HHD_STATUS_MAX_ATTEMPTS}: {transient_reason}, retrying in {HHD_STATUS_RETRY_DELAY:?}"
            );
            sleep(HHD_STATUS_RETRY_DELAY).await;
        } else {
            warn!(
                "{transient_reason} after {HHD_STATUS_MAX_ATTEMPTS} attempts, treating handheld daemon as inactive"
            );
        }
    }

    HhdStatus::Inactive
}

async fn hhd_set_value(subcommand: &str, value: &str) -> Result<()> {
    let output = Command::new(HHD_CMD)
        .arg(subcommand)
        .arg(value)
        .output()
        .await
        .map_err(|e| anyhow!("Failed to execute {HHD_CMD} {subcommand} {value}: {e}"))?;

    ensure!(
        output.status.success(),
        "{HHD_CMD} {subcommand} {value} exited with status {status}: {stderr}",
        status = output.status,
        stderr = String::from_utf8_lossy(&output.stderr).trim()
    );

    Ok(())
}

/// Runs `hhd.steamos <subcommand> get` and returns every whitespace-
/// separated numeric field from stdout. For `steamos-tdp` that is
/// [min, max, default]; for `steamos-gpu` it is [min, max].
async fn hhd_query_values(subcommand: &str) -> Result<Vec<u32>> {
    let output = Command::new(HHD_CMD)
        .arg(subcommand)
        .arg("get")
        .output()
        .await
        .map_err(|e| anyhow!("Failed to execute {HHD_CMD} {subcommand} get: {e}"))?;

    ensure!(
        output.status.success(),
        "{HHD_CMD} {subcommand} get exited with status {status}",
        status = output.status
    );

    let stdout = String::from_utf8(output.stdout)
        .map_err(|e| anyhow!("Invalid UTF-8 from {HHD_CMD} {subcommand} get: {e}"))?;

    let values: Vec<u32> = stdout
        .split_whitespace()
        .map(|part| {
            part.parse()
                .map_err(|e| anyhow!("Failed to parse value {part:?}: {e}"))
        })
        .collect::<Result<_>>()?;

    ensure!(
        values.len() >= 2,
        "Expected at least min and max from {HHD_CMD} {subcommand} get, got {stdout:?}"
    );

    Ok(values)
}

async fn hhd_query_range(subcommand: &str) -> Result<RangeInclusive<u32>> {
    let values = hhd_query_values(subcommand).await?;
    Ok(values[0]..=values[1])
}

/// Returns true when steamos-manager should expose its own
/// power-management interfaces, i.e. when HHD is not handling them.
pub(crate) async fn enable_power_features() -> bool {
    let hhd_status = get_hhd_status("steamos-tdp").await;
    info!("Handheld daemon TDP status: {:?}", hhd_status);
    hhd_status == HhdStatus::Inactive
}

struct HhdTdpManager {
    // Dernière limite envoyée avec succès (0 = inconnue). Le stub HHD ne
    // sait pas relire la valeur courante, mais renvoyer une erreur ici
    // faisait retomber la propriété TdpLimit1.TdpLimit sur 0 à chaque
    // relecture déclenchée par tdp_limit_changed après un set.
    last_tdp: AtomicU32,
}

#[async_trait]
impl TdpLimitManager for HhdTdpManager {
    async fn get_tdp_limit(&self) -> Result<u32> {
        let last = self.last_tdp.load(Ordering::Relaxed);
        if last != 0 {
            return Ok(last);
        }
        // Pas encore de set dans cette session : le stub publie le TDP
        // par défaut en troisième champ de `steamos-tdp get`, ce qui est
        // la meilleure approximation disponible de l'état courant.
        let values = hhd_query_values("steamos-tdp").await?;
        values
            .get(2)
            .copied()
            .ok_or_else(|| anyhow!("Handheld daemon did not report a default TDP"))
    }

    async fn set_tdp_limit(&self, limit: u32) -> Result<()> {
        hhd_set_value("steamos-tdp", &limit.to_string()).await?;
        self.last_tdp.store(limit, Ordering::Relaxed);
        Ok(())
    }

    async fn get_tdp_limit_range(&self) -> Result<RangeInclusive<u32>> {
        hhd_query_range("steamos-tdp").await
    }

    // hhd.steamos writes go through HHD's own local socket, which has been
    // unprivileged since HHD 4.1 (the socket is readable/writable by the
    // invoking user). There is no need to round-trip through the root
    // daemon for this, and doing so made TDP writes depend on the root
    // daemon having resolved a working manager at its own startup, which
    // races against Handheld Daemon's readiness. This mirrors the stock
    // RemoteInterfaceLimitManager, which also reports needs_root() = false
    // for the same reason: the privileged part of the operation, if any,
    // is the external daemon's responsibility, not steamos-manager's.
    fn needs_root(&self) -> bool {
        false
    }
}

#[derive(Debug)]
struct HhdPerformanceLevelDriver {
    // Dernière horloge envoyée avec succès (0 = inconnue), même logique
    // que HhdTdpManager::last_tdp.
    last_clocks: AtomicU32,
}

#[async_trait]
impl GpuPerformanceLevelDriver for HhdPerformanceLevelDriver {
    fn performance_level_from_str(&self, value: &str) -> Result<GpuPerformanceLevel> {
        Ok(GpuPerformanceLevel::Intel(IntelPerformanceLevel::from_str(
            value,
        )?))
    }

    async fn get_available_performance_levels(&self) -> Result<Vec<GpuPerformanceLevel>> {
        Ok(vec![
            GpuPerformanceLevel::Intel(IntelPerformanceLevel::Auto),
            GpuPerformanceLevel::Intel(IntelPerformanceLevel::Manual),
        ])
    }

    async fn get_performance_level(&self) -> Result<GpuPerformanceLevel> {
        // Just lie so that we always get a trigger to auto
        Ok(GpuPerformanceLevel::Intel(IntelPerformanceLevel::Manual))
    }

    async fn get_clocks(&self) -> Result<u32> {
        let last = self.last_clocks.load(Ordering::Relaxed);
        if last != 0 {
            return Ok(last);
        }
        // Rien n'a encore été fixé : renvoyer le minimum du range publié
        // par HHD plutôt qu'une constante arbitraire.
        Ok(*hhd_query_range("steamos-gpu").await?.start())
    }

    async fn set_performance_level(&self, level: GpuPerformanceLevel) -> Result<()> {
        if level == GpuPerformanceLevel::Intel(IntelPerformanceLevel::Manual) {
            return Ok(());
        }
        hhd_set_value("steamos-gpu", "clear").await?;
        self.last_clocks.store(0, Ordering::Relaxed);
        Ok(())
    }

    async fn get_clocks_range(&self) -> Result<RangeInclusive<u32>> {
        hhd_query_range("steamos-gpu").await
    }

    async fn set_clocks(&self, clocks: u32) -> Result<()> {
        hhd_set_value("steamos-gpu", &clocks.to_string()).await?;
        self.last_clocks.store(clocks, Ordering::Relaxed);
        Ok(())
    }
}

/// Hook for power::tdp_limit_manager(): returns Some when HHD owns TDP.
pub(crate) async fn tdp_limit_manager() -> Result<Option<Box<dyn TdpLimitManager>>> {
    match get_hhd_status("steamos-tdp").await {
        HhdStatus::Active => {
            debug!("Using handheld daemon for TDP limiting");
            Ok(Some(Box::new(HhdTdpManager {
                last_tdp: AtomicU32::new(0),
            })))
        }
        HhdStatus::Conflicts => bail!("Conflicting TDP limiting method found"),
        HhdStatus::Inactive => Ok(None),
    }
}

/// Hook for gpu::gpu_performance_level_driver(): returns Some when HHD
/// owns GPU clock control.
pub(crate) async fn gpu_performance_level_driver()
-> Result<Option<Box<dyn GpuPerformanceLevelDriver>>> {
    match get_hhd_status("steamos-gpu").await {
        HhdStatus::Active => {
            debug!("Using handheld daemon for GPU performance control");
            Ok(Some(Box::new(HhdPerformanceLevelDriver {
                last_clocks: AtomicU32::new(0),
            })))
        }
        HhdStatus::Conflicts => bail!("Conflicting GPU controls found"),
        HhdStatus::Inactive => Ok(None),
    }
}
