# Runs the tests of Pester like upstream's CI (azure-pipelines.yml), without the tests of the
# release (version, style and help), which testRelease.ps1 runs.
param(
    # The Pester repository
    [Parameter(Mandatory)] [string] $Path
)

Set-StrictMode -Version Latest
$global:PesterDebugPreference_ShowFullErrors = $true

Set-Location $Path
Import-Module ./Pester.psd1
Invoke-Pester -ExcludeTag VersionChecks, StyleRules, Help -EnableExit
