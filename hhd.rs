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
 */

use anyhow::{Result, anyhow, bail, ensure};
use async_trait::async_trait;
use std::ops::RangeInclusive;
use std::str::FromStr;
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
// inactif. Ajouté suite à un cas observé où le tout premier appel, fait
// très tôt au démarrage de TdpManagerService, échouait systématiquement
// (probablement l'agent polkit de session pas encore enregistré à ce
// stade), alors que les appels suivants (quelques centaines de ms plus
// tard) réussissaient à chaque fois. Comme le manager choisi ici est figé
// pour toute la durée de vie du daemon, un seul échec transitoire au
// premier appel suffisait à retomber sur RemoteInterfaceLimitManager pour
// toute la session.
const HHD_STATUS_MAX_ATTEMPTS: u32 = 3;
const HHD_STATUS_RETRY_DELAY: Duration = Duration::from_millis(250);

async fn get_hhd_status(subcommand: &str) -> HhdStatus {
    for attempt in 1..=HHD_STATUS_MAX_ATTEMPTS {
        match Command::new(HHD_CMD).arg(subcommand).arg("get").output().await {
            Ok(output) => {
                return match output.status.code().unwrap_or(0) {
                    1 => HhdStatus::Inactive,
                    2 => HhdStatus::Conflicts,
                    _ => HhdStatus::Active,
                };
            }
            Err(e) if attempt < HHD_STATUS_MAX_ATTEMPTS => {
                warn!(
                    "Attempt {attempt}/{HHD_STATUS_MAX_ATTEMPTS} to run {HHD_CMD} {subcommand} get failed: {e}, retrying in {HHD_STATUS_RETRY_DELAY:?}"
                );
                sleep(HHD_STATUS_RETRY_DELAY).await;
            }
            Err(e) => {
                warn!(
                    "Failed to run {HHD_CMD} {subcommand} get after {HHD_STATUS_MAX_ATTEMPTS} attempts: {e}, treating handheld daemon as inactive"
                );
                return HhdStatus::Inactive;
            }
        }
    }

    // Inatteignable : la boucle retourne toujours depuis Ok(..) ou le
    // dernier bras Err(..) ci-dessus, mais le compilateur ne peut pas le
    // déduire seul.
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
        "{HHD_CMD} {subcommand} {value} exited with status {status}",
        status = output.status
    );

    Ok(())
}

async fn hhd_query_range(subcommand: &str) -> Result<RangeInclusive<u32>> {
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

    let mut parts = stdout.split_whitespace();
    let min: u32 = parts
        .next()
        .ok_or_else(|| anyhow!("Missing min value"))?
        .parse()
        .map_err(|e| anyhow!("Failed to parse min value: {e}"))?;
    let max: u32 = parts
        .next()
        .ok_or_else(|| anyhow!("Missing max value"))?
        .parse()
        .map_err(|e| anyhow!("Failed to parse max value: {e}"))?;
    Ok(min..=max)
}

/// Returns true when steamos-manager should expose its own
/// power-management interfaces, i.e. when HHD is not handling them.
pub(crate) async fn enable_power_features() -> bool {
    let hhd_status = get_hhd_status("steamos-tdp").await;
    info!("Handheld daemon TDP status: {:?}", hhd_status);
    hhd_status == HhdStatus::Inactive
}

struct HhdTdpManager {}

#[async_trait]
impl TdpLimitManager for HhdTdpManager {
    async fn get_tdp_limit(&self) -> Result<u32> {
        bail!("Getting TDP from handheld daemon is not implemented.");
    }

    async fn set_tdp_limit(&self, limit: u32) -> Result<()> {
        hhd_set_value("steamos-tdp", &limit.to_string()).await
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
struct HhdPerformanceLevelDriver {}

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
        // Dummy value
        Ok(1200)
    }

    async fn set_performance_level(&self, level: GpuPerformanceLevel) -> Result<()> {
        if level == GpuPerformanceLevel::Intel(IntelPerformanceLevel::Manual) {
            return Ok(());
        }
        hhd_set_value("steamos-gpu", "clear").await
    }

    async fn get_clocks_range(&self) -> Result<RangeInclusive<u32>> {
        hhd_query_range("steamos-gpu").await
    }

    async fn set_clocks(&self, clocks: u32) -> Result<()> {
        hhd_set_value("steamos-gpu", &clocks.to_string()).await
    }
}

/// Hook for power::tdp_limit_manager(): returns Some when HHD owns TDP.
pub(crate) async fn tdp_limit_manager() -> Result<Option<Box<dyn TdpLimitManager>>> {
    match get_hhd_status("steamos-tdp").await {
        HhdStatus::Active => {
            debug!("Using handheld daemon for TDP limiting");
            Ok(Some(Box::new(HhdTdpManager {})))
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
            Ok(Some(Box::new(HhdPerformanceLevelDriver {})))
        }
        HhdStatus::Conflicts => bail!("Conflicting GPU controls found"),
        HhdStatus::Inactive => Ok(None),
    }
}
