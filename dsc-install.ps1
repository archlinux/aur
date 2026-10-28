# Copies the files upstream packages for Linux (PackageFiles.Linux in data.build.json) from the
# release build into a folder, like upstream's Build-DscTgzPackage does
param(
    # The DSC repository, which has to be built already
    [Parameter(Mandatory)] [string] $SourcePath,
    # The folder to install DSC to
    [Parameter(Mandatory)] [string] $Destination
)

Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'

Set-Location -LiteralPath $SourcePath
Import-Module ./helpers.build.psm1

$buildData = Import-DscBuildData -RefreshProjects
$bin = (Get-ArtifactDirectoryPath -Release).Bin

$null = New-Item -ItemType Directory -Path $Destination -Force
foreach ($file in $buildData.PackageFiles.Linux) {
    Copy-Item -LiteralPath (Join-Path $bin $file) -Destination $Destination -Recurse
}
