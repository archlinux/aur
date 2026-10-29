# Offline smoke test of PSResourceGet, which is built differently from upstream (psresourceget-net10.patch):
# publish a module to a local folder repository, then find, install, import, save and uninstall it
param(
    # Folder to put the repository and the test module into
    [Parameter(Mandatory)] [string] $WorkPath
)

Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'

$repository = New-Item -ItemType Directory -Force -Path (Join-Path $WorkPath 'repository')
$module = New-Item -ItemType Directory -Force -Path (Join-Path $WorkPath 'module/PSResourceGetTest')
$saved = Join-Path $WorkPath 'saved'

Set-Content -LiteralPath (Join-Path $module 'PSResourceGetTest.psm1') -Value 'function Get-PSResourceGetTest { 42 }'
New-ModuleManifest -Path (Join-Path $module 'PSResourceGetTest.psd1') -RootModule 'PSResourceGetTest.psm1' `
    -ModuleVersion '1.2.3' -FunctionsToExport 'Get-PSResourceGetTest' -Author 'Arch Linux' -Description 'Test module'

Register-PSResourceRepository -Name 'LocalTest' -Uri $repository.FullName -Trusted
try {
    Publish-PSResource -Path $module.FullName -Repository 'LocalTest'

    $found = Find-PSResource -Name 'PSResourceGetTest' -Repository 'LocalTest'
    if ($found.Version -ne [version] '1.2.3') {
        throw "Find-PSResource found version $($found.Version)"
    }

    Install-PSResource -Name 'PSResourceGetTest' -Repository 'LocalTest' -Scope CurrentUser
    $installed = Get-InstalledPSResource -Name 'PSResourceGetTest' -Scope CurrentUser
    if ($installed.Version -ne [version] '1.2.3') {
        throw "Get-InstalledPSResource found version $($installed.Version)"
    }
    Import-Module -Name 'PSResourceGetTest'
    if ((Get-PSResourceGetTest) -ne 42) {
        throw 'The installed module does not work'
    }
    Remove-Module -Name 'PSResourceGetTest'

    $null = New-Item -ItemType Directory -Force -Path $saved
    Save-PSResource -Name 'PSResourceGetTest' -Repository 'LocalTest' -Path $saved
    if (-not (Test-Path -LiteralPath (Join-Path $saved 'PSResourceGetTest/1.2.3/PSResourceGetTest.psd1'))) {
        throw 'Save-PSResource did not save the module'
    }

    Uninstall-PSResource -Name 'PSResourceGetTest' -Scope CurrentUser
    if (Get-InstalledPSResource -Name 'PSResourceGetTest' -Scope CurrentUser -ErrorAction Ignore) {
        throw 'Uninstall-PSResource did not uninstall the module'
    }
}
finally {
    Unregister-PSResourceRepository -Name 'LocalTest'
}

'PSResourceGet works'
