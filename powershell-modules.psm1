# Helpers for building the modules PowerShell ships (src/Modules/PSGalleryModules.csproj) from source.
# The projects are built as upstream does, i.e. against PowerShell reference assemblies like
# PowerShellStandard.Library, which are only used for compiling and aren't shipped.

Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'

# Runs dotnet with the given arguments and throws if it fails.
function Invoke-Dotnet {
    # Send the output to the host, so it does not end up in return values
    & dotnet @args | Out-Host
    if ($LASTEXITCODE -ne 0) {
        throw "'dotnet $args' failed with exit code $LASTEXITCODE"
    }
}

<#
.SYNOPSIS
Publish a project with the given NuGet configuration and return the publish folder.
#>
function Publish-ModuleProject {
    param(
        [Parameter(Mandatory)] [string] $Path,
        [Parameter(Mandatory)] [string] $NuGetConfig,
        [Parameter(Mandatory)] [string] $OutputPath,
        [string] $Framework
    )

    $frameworkArgs = if ($Framework) { '--framework', $Framework } else { @() }
    Invoke-Dotnet restore $Path --configfile $NuGetConfig
    # MSBuild properties need quoting, PowerShell would split them at the colon otherwise
    Invoke-Dotnet publish $Path --no-restore --configuration Release --output $OutputPath @frameworkArgs `
        '-p:TreatWarningsAsErrors=false' '-p:EnableNETAnalyzers=false'
    $OutputPath
}

function Get-ProjectXml([string] $Path) {
    $xml = [xml]::new()
    $xml.PreserveWhitespace = $true
    $xml.Load((Resolve-Path -LiteralPath $Path).ProviderPath)
    $xml
}

function Save-ProjectXml([xml] $Xml) {
    $Xml.Save([uri]::new($Xml.BaseURI).LocalPath)
}

# Replace the NuGet configurations of a repository, which often point to internal feeds
function Set-RepositoryNuGetConfig([string] $SourcePath, [string] $NuGetConfig) {
    $configs = Get-ChildItem -Recurse -File -Path $SourcePath | Where-Object Name -EQ 'nuget.config'
    foreach ($config in $configs) {
        Copy-Item -LiteralPath $NuGetConfig -Destination $config.FullName -Force
    }
}

function New-ModuleFolder([string] $Path) {
    if (Test-Path -LiteralPath $Path) {
        Remove-Item -LiteralPath $Path -Recurse -Force
    }
    $null = New-Item -ItemType Directory -Path $Path
}

<#
.SYNOPSIS
Microsoft.PowerShell.Archive is a pure script module.
#>
function Build-ArchiveModule {
    param(
        [Parameter(Mandatory)] [string] $SourcePath,
        [Parameter(Mandatory)] [string] $OutputPath
    )

    $moduleOut = Join-Path $OutputPath 'Microsoft.PowerShell.Archive'
    New-ModuleFolder $moduleOut
    Copy-Item -Recurse -Path (Join-Path $SourcePath 'Microsoft.PowerShell.Archive/*') -Destination $moduleOut
}

<#
.SYNOPSIS
Microsoft.PowerShell.ThreadJob, see doBuild.ps1 in its repository.
#>
function Build-ThreadJobModule {
    param(
        [Parameter(Mandatory)] [string] $SourcePath,
        [Parameter(Mandatory)] [string] $OutputPath,
        [Parameter(Mandatory)] [string] $NuGetConfig
    )

    $moduleName = 'Microsoft.PowerShell.ThreadJob'
    $project = Join-Path $SourcePath "src/code/$moduleName.csproj"
    $publish = Publish-ModuleProject -Path $project -NuGetConfig $NuGetConfig -OutputPath (Join-Path $SourcePath 'publish')

    $moduleOut = Join-Path $OutputPath $moduleName
    New-ModuleFolder $moduleOut
    Copy-Item -Path (Join-Path $SourcePath "src/$moduleName.psd1"), (Join-Path $publish "$moduleName.dll"),
        (Join-Path $SourcePath 'LICENSE'), (Join-Path $SourcePath 'ThirdPartyNotices.txt') -Destination $moduleOut
    Copy-Item -Recurse -Path (Join-Path $SourcePath 'help/en-us') -Destination (Join-Path $moduleOut 'en-US')
}

<#
.SYNOPSIS
PSReadLine, see the LayoutModule task in PSReadLine.build.ps1 of its repository.
Microsoft.PowerShell.Pager, which it depends on, is built from source as well.
#>
function Build-PSReadLineModule {
    param(
        [Parameter(Mandatory)] [string] $SourcePath,
        [Parameter(Mandatory)] [string] $PagerSourcePath,
        [Parameter(Mandatory)] [string] $OutputPath,
        [Parameter(Mandatory)] [string] $NuGetConfig
    )

    # PSReadLine only needs the netstandard2.0 build of Pager
    $pagerProject = Join-Path $PagerSourcePath 'src/Microsoft.PowerShell.Pager.csproj'
    $xml = Get-ProjectXml $pagerProject
    $xml.SelectSingleNode('//TargetFrameworks').InnerText = 'netstandard2.0'
    Save-ProjectXml $xml

    # Reference the Pager project instead of its package
    $project = Join-Path $SourcePath 'PSReadLine/PSReadLine.csproj'
    $xml = Get-ProjectXml $project
    $pagerReference = $xml.SelectSingleNode('//PackageReference[@Include="Microsoft.PowerShell.Pager"]')
    $projectReference = $xml.CreateElement('ProjectReference')
    $projectReference.SetAttribute('Include', (Resolve-Path -LiteralPath $pagerProject).ProviderPath)
    $null = $pagerReference.ParentNode.ReplaceChild($projectReference, $pagerReference)
    Save-ProjectXml $xml

    $polyfill = Join-Path $SourcePath 'Polyfill/Polyfill.csproj'
    $polyfillNetstd = Publish-ModuleProject -Path $polyfill -NuGetConfig $NuGetConfig -Framework netstandard2.0 `
        -OutputPath (Join-Path $SourcePath 'publish/polyfill-netstd')
    $polyfillNet6 = Publish-ModuleProject -Path $polyfill -NuGetConfig $NuGetConfig -Framework net6.0 `
        -OutputPath (Join-Path $SourcePath 'publish/polyfill-net6plus')
    $publish = Publish-ModuleProject -Path $project -NuGetConfig $NuGetConfig -OutputPath (Join-Path $SourcePath 'publish/psreadline')

    $moduleOut = Join-Path $OutputPath 'PSReadLine'
    New-ModuleFolder $moduleOut
    Copy-Item -Path (Join-Path $SourcePath 'License.txt') -Destination $moduleOut
    foreach ($file in 'Changes.txt', 'SamplePSReadLineProfile.ps1', 'PSReadLine.format.ps1xml', 'PSReadLine.psm1') {
        Copy-Item -Path (Join-Path $SourcePath "PSReadLine/$file") -Destination $moduleOut
    }
    $null = New-Item -ItemType Directory -Path (Join-Path $moduleOut 'netstd'), (Join-Path $moduleOut 'net6plus')
    Copy-Item -Path (Join-Path $polyfillNetstd 'Microsoft.PowerShell.PSReadLine.Polyfiller.dll') -Destination (Join-Path $moduleOut 'netstd')
    Copy-Item -Path (Join-Path $polyfillNet6 'Microsoft.PowerShell.PSReadLine.Polyfiller.dll') -Destination (Join-Path $moduleOut 'net6plus')
    Copy-Item -Path (Join-Path $publish 'Microsoft.PowerShell.PSReadLine.dll'), (Join-Path $publish 'Microsoft.PowerShell.Pager.dll') `
        -Destination $moduleOut

    # Like upstream, take the module version from the assembly and add the project URI
    $versionInfo = (Get-Item -LiteralPath (Join-Path $moduleOut 'Microsoft.PowerShell.PSReadLine.dll')).VersionInfo
    $manifest = Get-Content -Raw -LiteralPath (Join-Path $SourcePath 'PSReadLine/PSReadLine.psd1')
    $privateData = "PrivateData = @{ PSData = @{ ProjectUri = 'https://github.com/PowerShell/PSReadLine' } }"
    if ($versionInfo.ProductVersion -match '^[^-+]+-([^+]+)') {
        $privateData = "PrivateData = @{ PSData = @{ Prerelease = '$($Matches[1])'; ProjectUri = 'https://github.com/PowerShell/PSReadLine' } }"
    }
    $manifest = [regex]::Replace($manifest, '}', "$privateData$([Environment]::NewLine)}")
    $manifest = [regex]::Replace($manifest, "ModuleVersion = '.*'", "ModuleVersion = '$($versionInfo.FileVersion)'")
    Set-Content -LiteralPath (Join-Path $moduleOut 'PSReadLine.psd1') -Value $manifest
}

<#
.SYNOPSIS
Return the values assigned to a variable in a script, e.g. the list of files an upstream build script copies.
#>
function Get-ScriptArrayValue {
    param(
        [Parameter(Mandatory)] [string] $Path,
        [Parameter(Mandatory)] [string] $VariableName
    )

    $ast = [System.Management.Automation.Language.Parser]::ParseFile((Resolve-Path -LiteralPath $Path).ProviderPath, [ref] $null, [ref] $null)
    $assignment = $ast.Find({
            param($node)
            $node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
            $node.Left -is [System.Management.Automation.Language.VariableExpressionAst] -and
            $node.Left.VariablePath.UserPath -eq $VariableName
        }, $true)
    if (-not $assignment) {
        throw "No assignment to `$$VariableName found in $Path"
    }
    $assignment.Right.FindAll({ param($node) $node -is [System.Management.Automation.Language.StringConstantExpressionAst] }, $true).Value
}

<#
.SYNOPSIS
Microsoft.PowerShell.PSResourceGet, see doBuild.ps1 in its repository.
#>
function Build-PSResourceGetModule {
    param(
        [Parameter(Mandatory)] [string] $SourcePath,
        [Parameter(Mandatory)] [string] $OutputPath,
        [Parameter(Mandatory)] [string] $NuGetConfig
    )

    $moduleName = 'Microsoft.PowerShell.PSResourceGet'
    $project = Join-Path $SourcePath "src/code/$moduleName.csproj"
    # Upstream publishes for its only target framework (net472), also for PowerShell 7
    $framework = (Get-ProjectXml $project).SelectSingleNode('//TargetFrameworks').InnerText
    $publish = Publish-ModuleProject -Path $project -NuGetConfig $NuGetConfig -Framework $framework `
        -OutputPath (Join-Path $SourcePath 'publish')

    $moduleOut = Join-Path $OutputPath $moduleName
    New-ModuleFolder $moduleOut
    foreach ($file in "$moduleName.psd1", "$moduleName.psm1", 'PSGet.Format.ps1xml', 'InstallPSResourceGetPolicyDefinitions.ps1',
        'PSResourceRepository.adml', 'PSResourceRepository.admx') {
        Copy-Item -Path (Join-Path $SourcePath "src/$file") -Destination $moduleOut
    }
    Copy-Item -Path (Join-Path $SourcePath 'LICENSE'), (Join-Path $SourcePath 'Notice.txt') -Destination $moduleOut

    $doBuild = Join-Path $SourcePath 'doBuild.ps1'
    foreach ($assembly in Get-ScriptArrayValue -Path $doBuild -VariableName 'assemblyNames') {
        Copy-Item -Path (Join-Path $publish "$assembly.dll") -Destination $moduleOut
    }
    $dependencies = New-Item -ItemType Directory -Path (Join-Path $moduleOut 'dependencies')
    foreach ($assembly in Get-ScriptArrayValue -Path $doBuild -VariableName 'depAssemblyNames') {
        Copy-Item -Path (Join-Path $publish "$assembly.dll") -Destination $dependencies
    }
}

<#
.SYNOPSIS
PowerShellGet 2.x is a script module, which upstream assembles with Publish-ModuleArtifacts from tools/build.psm1.
#>
function Build-PowerShellGetModule {
    param(
        [Parameter(Mandatory)] [string] $SourcePath,
        [Parameter(Mandatory)] [string] $OutputPath
    )

    # The DSC resources folder is called DscResources, which only works on case-insensitive file systems
    $buildScript = Join-Path $SourcePath 'tools/build.psm1'
    (Get-Content -Raw -LiteralPath $buildScript).Replace('\DSCResources"', '\DscResources"') |
        Set-Content -NoNewline -LiteralPath $buildScript

    $buildModule = Import-Module -Force -PassThru -Name $buildScript
    try {
        # Publish-ModuleArtifacts also zips the result, using a variable it doesn't define
        $tempPath = (New-Item -ItemType Directory -Force -Path (Join-Path $SourcePath 'tmp')).FullName
        & $buildModule {
            param($TempPath)
            $script:TempPath = $TempPath
            Publish-ModuleArtifacts
        } $tempPath
    }
    finally {
        Remove-Module $buildModule
    }

    $moduleOut = Join-Path $OutputPath 'PowerShellGet'
    New-ModuleFolder $moduleOut
    Copy-Item -Recurse -Path (Join-Path $SourcePath 'dist/PowerShellGet/*') -Destination $moduleOut
    # The released module also has the resources in en-US
    $null = New-Item -ItemType Directory -Path (Join-Path $moduleOut 'en-US')
    Copy-Item -Path (Join-Path $moduleOut 'PSGet.Resource.psd1') -Destination (Join-Path $moduleOut 'en-US')
}

<#
.SYNOPSIS
PackageManagement (OneGet), built with src/build.ps1 of its repository for .NET Core (netstandard2.0).
#>
function Build-PackageManagementModule {
    param(
        [Parameter(Mandatory)] [string] $SourcePath,
        [Parameter(Mandatory)] [string] $OutputPath,
        [Parameter(Mandatory)] [string] $NuGetConfig
    )

    Set-RepositoryNuGetConfig -SourcePath $SourcePath -NuGetConfig $NuGetConfig
    $src = Join-Path $SourcePath 'src'

    # Only the netstandard2.0 build is used by PowerShell 7. It was compiled against
    # System.Management.Automation 1.0.0-alpha9 from a long gone feed, so use the PowerShell Standard
    # reference assemblies instead, which cover exactly the API available on all editions.
    foreach ($project in Get-ChildItem -Recurse -File -Path $src -Filter '*.csproj') {
        $xml = Get-ProjectXml $project.FullName
        $frameworks = $xml.SelectSingleNode('//TargetFrameworks')
        if (-not $frameworks -or $frameworks.InnerText -notmatch 'netstandard2\.0') {
            continue
        }
        $frameworks.InnerText = 'netstandard2.0'
        foreach ($reference in @($xml.SelectNodes('//PackageReference[@Include="System.Management.Automation"]'))) {
            $reference.SetAttribute('Include', 'PowerShellStandard.Library')
            $reference.SetAttribute('Version', '5.1.0')
            $reference.SetAttribute('PrivateAssets', 'all')
            # These used to come in with the old System.Management.Automation package.
            # They're part of the runtime of PowerShell 7, so they're only needed for compiling.
            foreach ($package in @{ 'Microsoft.Win32.Registry' = '4.7.0'; 'System.Reflection.Emit' = '4.7.0'; 'System.Reflection.Emit.Lightweight' = '4.7.0' }.GetEnumerator()) {
                $dependency = $xml.CreateElement('PackageReference')
                $dependency.SetAttribute('Include', $package.Key)
                $dependency.SetAttribute('Version', $package.Value)
                $dependency.SetAttribute('PrivateAssets', 'all')
                $null = $reference.ParentNode.AppendChild($dependency)
            }
        }
        Save-ProjectXml $xml
    }

    # The NuGet provider (a submodule) references the core of PackageManagement as package from an internal feed
    $nugetProvider = Join-Path $src 'Microsoft.PackageManagement.NuGetProvider/NuGetProvider.csproj'
    $xml = Get-ProjectXml $nugetProvider
    $coreReference = $xml.SelectSingleNode('//PackageReference[@Include="Microsoft.PowerShell.PackageManagement.Core"]')
    $projectReference = $xml.CreateElement('ProjectReference')
    $projectReference.SetAttribute('Include', '../Microsoft.PackageManagement/Microsoft.PackageManagement.csproj')
    $null = $coreReference.ParentNode.ReplaceChild($projectReference, $coreReference)
    Save-ProjectXml $xml

    Push-Location -LiteralPath $src
    try {
        & ./build.ps1 -Framework netstandard2.0 -Configuration Release
    }
    finally {
        Pop-Location
    }

    $moduleOut = Join-Path $OutputPath 'PackageManagement'
    New-ModuleFolder $moduleOut
    Copy-Item -Recurse -Path (Join-Path $src 'out/PackageManagement/*') -Destination $moduleOut
}

<#
.SYNOPSIS
Compile the assemblies of the built modules to ReadyToRun images with crossgen2, like the SDK does for
PublishReadyToRun. The SDK can't do it for these projects, as they target netstandard2.0 or .NET Framework.
The images are compiled against the .NET runtime and $PSHOME, as that is what the modules run on.
#>
function Invoke-ReadyToRunCompiler {
    param(
        # The Modules folder of the PowerShell being built
        [Parameter(Mandatory)] [string] $ModulePath,
        [Parameter(Mandatory)] [string] $Crossgen2Path
    )

    # Assemblies the runtime or PowerShell itself provide are loaded from there instead of the module,
    # so the module's copies are neither compiled nor used as references
    $psHome = Split-Path -Parent (Resolve-Path -LiteralPath $ModulePath).ProviderPath
    $platformAssemblies = @(
        Get-ChildItem -File -Path ([System.Runtime.InteropServices.RuntimeEnvironment]::GetRuntimeDirectory()) -Filter '*.dll'
        Get-ChildItem -File -Path $psHome -Filter '*.dll'
    )
    $platformNames = [System.Collections.Generic.HashSet[string]]::new([string[]] $platformAssemblies.BaseName, [StringComparer]::OrdinalIgnoreCase)

    foreach ($module in Get-ChildItem -Directory -Path $ModulePath) {
        # PSReadLine's netstd Polyfiller is only loaded by Windows PowerShell, PowerShell 7 uses net6plus
        $assemblies = @(Get-ChildItem -Recurse -File -Path $module.FullName -Filter '*.dll' |
                Where-Object { $_.Directory.Name -ne 'netstd' -and -not $platformNames.Contains($_.BaseName) })
        $duplicates = $assemblies | Group-Object BaseName | Where-Object Count -GT 1
        if ($duplicates) {
            throw "Module $($module.Name) has more than one assembly named $($duplicates.Name -join ', ')"
        }

        foreach ($assembly in $assemblies) {
            $references = @($platformAssemblies) + @($assemblies | Where-Object FullName -NE $assembly.FullName)
            $referenceArgs = foreach ($reference in $references) { '-r', $reference.FullName }
            $output = "$($assembly.FullName).r2r"
            & $Crossgen2Path $assembly.FullName --out $output --targetos linux --targetarch x64 -O @referenceArgs | Out-Host
            if ($LASTEXITCODE -ne 0) {
                throw "crossgen2 failed for $($assembly.FullName) with exit code $LASTEXITCODE"
            }
            Move-Item -LiteralPath $output -Destination $assembly.FullName -Force
        }
    }
}

Export-ModuleMember -Function Build-*, Invoke-ReadyToRunCompiler
