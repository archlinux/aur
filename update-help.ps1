# Installs the en-US help of the core and bundled modules into $PSHOME of the PowerShell being packaged.
# It has to be run with that PowerShell, or with one for the build host on a cross build.
#
# As help is installed in the module location, the core help pages would become orphaned files
# otherwise, and every user on a machine would always need to download the help.
# Including them in the package also ensures they will have proper permissions.
#
# Help is only available as en-US UICulture, see about_Updatable_Help.help.txt

param(
    # $PSHOME of the PowerShell being packaged. A cross build runs this with a PowerShell for the build
    # host and passes the one for the target.
    [string] $PowerShellHome = $PSHOME
)

Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'

# Only look at the modules of $PowerShellHome, so modules of the same name installed elsewhere are ignored
$env:PSModulePath = Join-Path $PowerShellHome Modules
$modules = @(
    # Microsoft.PowerShell.Core is a snap-in without a module folder, it has the about_ topics
    'Microsoft.PowerShell.Core'
    (Get-ChildItem -Directory -Path $env:PSModulePath).Name
)

Update-Help -Module $modules -UICulture en-US -Scope AllUsers

# The help of Microsoft.PowerShell.Core goes into $PSHOME of the running PowerShell
if ((Resolve-Path -LiteralPath $PowerShellHome).Path -ne (Resolve-Path -LiteralPath $PSHOME).Path) {
    $coreHelp = New-Item -ItemType Directory -Force -Path (Join-Path $PowerShellHome en-US)
    Copy-Item -Recurse -Force -Path (Join-Path $PSHOME en-US/*) -Destination $coreHelp
}
