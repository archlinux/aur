# Builds DSC with upstream's build helpers, like build.ps1 does for a release build
param(
    # The DSC repository
    [Parameter(Mandatory)] [string] $SourcePath,
    # The Rust target to build for (upstream's names), current for the build host
    [string] $Architecture = 'current'
)

Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'

Set-Location -LiteralPath $SourcePath
Import-Module ./helpers.build.psm1

$buildData = Import-DscBuildData -RefreshProjects
Export-GrammarBinding -Project $buildData.Projects

$buildParams = @{
    Project = $buildData.Projects
    Release = $true
    Architecture = $Architecture
}
Build-RustProject @buildParams
$null = Copy-BuildArtifact @buildParams -ExecutableFile $buildData.PackageFiles.Executable
