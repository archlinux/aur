# Runs PowerShell's test of its DSC resource for profiles with the PowerShell running this script and
# the built dsc, like PowerShell's build.psm1:Start-PSPester() does, with Pester 4 from
# powershell-pester-4. The tests for all users write into $PSHOME, so they're left out.
# StrictMode and $ErrorActionPreference aren't changed, as they'd leak into the test.
param(
    # The folder with the built dsc and its resources
    [Parameter(Mandatory)] [string] $DscRoot,
    # dsc.profileresource.Tests.ps1, with the configurations it uses next to it
    [Parameter(Mandatory)] [string] $TestPath
)

$env:DSC_ROOT = $DscRoot
Import-Module -Name Pester -MaximumVersion 4.99 -ErrorAction Stop
Invoke-Pester -Script $TestPath -ExcludeTag RequireSudoOnUnix -EnableExit
