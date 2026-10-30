# Builds the modules PowerShell bundles (src/Modules/PSGalleryModules.csproj) from source,
# instead of downloading them from the PowerShell Gallery like build.psm1:Restore-PSModuleToBuild() does.
param(
    # The folder containing the module sources and the helpers, i.e. $srcdir
    [Parameter(Mandatory)] [string] $SourcePath,
    # The Modules folder of the PowerShell being built
    [Parameter(Mandatory)] [string] $OutputPath,
    # crossgen2 of the source-built .NET, to compile the module assemblies to ReadyToRun
    [Parameter(Mandatory)] [string] $Crossgen2Path
)

Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'

Import-Module (Join-Path $SourcePath powershell-modules.psm1)
# The modules only compile against reference packages, which don't need to match the .NET runtime
$nugetConfig = Join-Path $SourcePath nuget-modules.config

Build-PowerShellGetModule -SourcePath (Join-Path $SourcePath PowerShellGetv2) -OutputPath $OutputPath
Build-PackageManagementModule -SourcePath (Join-Path $SourcePath oneget) -OutputPath $OutputPath -NuGetConfig $nugetConfig
# PSResourceGet is built against the packages of the source-built .NET and the system feed, see the PKGBUILD
Build-PSResourceGetModule -SourcePath (Join-Path $SourcePath PSResourceGet) -OutputPath $OutputPath `
    -NuGetConfig (Join-Path $SourcePath PSResourceGet/nuget.config)
Build-ArchiveModule -SourcePath (Join-Path $SourcePath Microsoft.PowerShell.Archive) -OutputPath $OutputPath
Build-PSReadLineModule -SourcePath (Join-Path $SourcePath PSReadLine) -PagerSourcePath (Join-Path $SourcePath Pager) `
    -OutputPath $OutputPath -NuGetConfig $nugetConfig
Build-ThreadJobModule -SourcePath (Join-Path $SourcePath ThreadJob) -OutputPath $OutputPath -NuGetConfig $nugetConfig

Invoke-ReadyToRunCompiler -ModulePath $OutputPath -Crossgen2Path $Crossgen2Path
