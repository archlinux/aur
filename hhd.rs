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
use tokio::process::Command;
use tracing::{debug, info};

use crate::gpu::{GpuPerformanceLevel, GpuPerformanceLevelDriver, IntelPerformanceLevel};
use crate::power::TdpLimitManager;

#[derive(PartialEq, Debug)]
enum HhdStatus {
    Inactive,
    Active,
    Conflicts,
}

const HHD_CMD: &str = "hhd.steamos";

async fn get_hhd_status(subcommand: &str) -> HhdStatus {
    let Ok(output) = Command::new(HHD_CMD)
        .arg(subcommand)
        .arg("get")
        .output()
        .await
    else {
        return HhdStatus::Inactive;
    };

    match output.status.code().unwrap_or(0) {
        1 => HhdStatus::Inactive,
        2 => HhdStatus::Conflicts,
        _ => HhdStatus::Active,
    }
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
