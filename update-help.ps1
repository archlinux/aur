# Installs the en-US help of the bundled modules into $PSHOME. It has to be run with the
# PowerShell being packaged.
#
# As help is installed in the module location, the core help pages would become orphaned files
# otherwise, and every user on a machine would always need to download the help.
# Including them in the package also ensures they will have proper permissions.
#
# Help is only available as en-US UICulture, see about_Updatable_Help.help.txt

Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'

# Only look at the modules of $PSHOME, so modules of the same name installed elsewhere are ignored
$env:PSModulePath = Join-Path $PSHOME Modules
$modules = (Get-ChildItem -Directory -Path $env:PSModulePath).Name

Update-Help -Module $modules -UICulture en-US -Scope AllUsers
