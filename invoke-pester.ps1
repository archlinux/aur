# Runs the Pester tests of PowerShell, replicating build.psm1:Restore-PSPester() and Start-PSPester().
# It has to be run with the PowerShell being tested, from the root of its repository.
# StrictMode and $ErrorActionPreference aren't changed, as they'd leak into the tests.

$repository = $PWD.ProviderPath
$buildModules = New-Item -ItemType Directory -Path (Join-Path $repository build-modules) -Force

# Save the Pester version build.psm1 asks for
$saveCommand = "$((Get-Content (Join-Path $repository build.psm1)) -match 'Save-Module -Name Pester')"
$pesterArgs = @{
    Name       = 'Pester'
    Path       = $buildModules.FullName
    Repository = 'PSGallery'
}
foreach ($option in 'MaximumVersion', 'MinimumVersion') {
    $match = [regex]::Match($saveCommand, "-$option\s+(?<version>[\d\.]+)")
    if ($match.Success) {
        $pesterArgs[$option] = $match.Groups['version'].Value
    }
}
Save-Module @pesterArgs -ErrorAction Stop

$env:PSModulePath = @(
    $buildModules.FullName
    Join-Path $repository test/tools/Modules
    $env:PSModulePath
) -join [System.IO.Path]::PathSeparator

Import-Module Pester -ErrorAction Stop
Invoke-Pester -Show Header, Failed, Summary -EnableExit `
    -OutputFormat NUnitXml -OutputFile (Join-Path $repository pester-tests.xml) `
    -ExcludeTag Slow, RequireSudoOnUnix `
    -Tag CI, Feature `
    -Script (Join-Path $repository test/powershell)
