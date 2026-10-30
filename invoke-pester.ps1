# Runs the Pester tests of PowerShell, replicating build.psm1:Restore-PSPester() and Start-PSPester().
# It has to be run with the PowerShell being tested, from the root of its repository.
# StrictMode and $ErrorActionPreference aren't changed, as they'd leak into the tests.

$repository = $PWD.ProviderPath

# Pester comes from powershell-pester-4, in the version build.psm1 asks for. The PowerShell being
# tested has no powershell.config.json yet, which would add /usr/share/powershell/Modules.
$saveCommand = "$((Get-Content (Join-Path $repository build.psm1)) -match 'Save-Module -Name Pester')"
$pesterArgs = @{
    Name = 'Pester'
}
foreach ($option in 'MaximumVersion', 'MinimumVersion') {
    $match = [regex]::Match($saveCommand, "-$option\s+(?<version>[\d\.]+)")
    if ($match.Success) {
        $pesterArgs[$option] = $match.Groups['version'].Value
    }
}

$env:PSModulePath = @(
    Join-Path $repository test/tools/Modules
    $env:PSModulePath
    '/usr/share/powershell/Modules'
) -join [System.IO.Path]::PathSeparator

Import-Module @pesterArgs -ErrorAction Stop
Invoke-Pester -Show Header, Failed, Summary -EnableExit `
    -OutputFormat NUnitXml -OutputFile (Join-Path $repository pester-tests.xml) `
    -ExcludeTag Slow, RequireSudoOnUnix `
    -Tag CI, Feature `
    -Script (Join-Path $repository test/powershell)
