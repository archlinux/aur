# Runs the Rust and Pester tests of DSC with upstream's build helpers
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '',
    Justification = 'Test-ProjectWithPester runs Pester from its module, which only sees a global PesterPreference')]
param(
    # The DSC repository, which has to be built already
    [Parameter(Mandatory)] [string] $SourcePath,
    # Folder to save the PowerShell modules the tests need into
    [Parameter(Mandatory)] [string] $ModulePath
)

Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'

Set-Location -LiteralPath $SourcePath

$null = New-Item -ItemType Directory -Path $ModulePath -Force
$env:PSModulePath = $ModulePath + [System.IO.Path]::PathSeparator + $env:PSModulePath
foreach ($module in 'Pester', 'YaYaml', 'PSToml') {
    Save-PSResource -Name $module -Repository PSGallery -TrustRepository -Path $ModulePath
    Import-Module $module
}

Import-Module ./helpers.build.psm1
$buildData = Import-DscBuildData -RefreshProjects
# Put the built dsc and resources on PATH
Update-PathEnvironment -Release

Test-RustProject -Project $buildData.Projects -Release

# Test-ProjectWithPester only reports failed tests, make them fail the build instead
$global:PesterPreference = New-PesterConfiguration
$global:PesterPreference.Run.Throw = $true
Test-ProjectWithPester -Project $buildData.Projects -Group dsc, adapters, extensions, grammars, resources
