# Runs Pester tests with Pester 4: PowerShell's own with the tags of its CI, or the given ones.
# It has to be run with the PowerShell being tested.
# StrictMode and $ErrorActionPreference aren't changed, as they'd leak into the tests.
param(
    # The PowerShell repository
    [Parameter(Mandatory)] [string] $Repository,
    # The modules folder Pester is in (Pester/<version>), see check()
    [Parameter(Mandatory)] [string] $ModulePath,
    # Other tests to run instead of PowerShell's, all of them rather than the ones its CI runs
    [string] $Script
)

# Pester in the version build.psm1 asks for, from the given folder. The PowerShell being tested has
# no powershell.config.json yet, which would add /usr/share/powershell/Modules.
$saveCommand = "$((Get-Content (Join-Path $Repository build.psm1)) -match 'Save-Module -Name Pester')"
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
    Join-Path $Repository test/tools/Modules
    $env:PSModulePath
    $ModulePath
) -join [System.IO.Path]::PathSeparator

Import-Module @pesterArgs -ErrorAction Stop
if ($Script) {
    Invoke-Pester -Show Header, Failed, Summary -EnableExit -Script $Script
} else {
    Invoke-Pester -Show Header, Failed, Summary -EnableExit `
        -OutputFormat NUnitXml -OutputFile (Join-Path $Repository pester-tests.xml) `
        -ExcludeTag Slow, RequireSudoOnUnix `
        -Tag CI, Feature `
        -Script (Join-Path $Repository test/powershell)
}
