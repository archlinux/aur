# Runs the tests of PowerShell Standard 5 for .NET Standard (core), like Invoke-Test -CoreOnly in
# PowerShellStandard.psm1: a cmdlet is built against the library and run, and the API is checked.
param(
    # The PowerShellStandard repository, with the library built
    [Parameter(Mandatory)] [string] $Path
)

Set-Location (Join-Path $Path test/5/core)
Invoke-Pester -EnableExit
