# Builds the external (MAML) help of a module from its markdown documentation with platyPS, like the
# BuildCmdletHelp task of PowerShellEditorServices.build.ps1 and Start-DocumentationBuild in
# PSScriptAnalyzer's build.psm1 do
param(
    # The platyPS module built from source
    [Parameter(Mandatory)] [string] $PlatyPSPath,
    # The folder with the markdown files
    [Parameter(Mandatory)] [string] $DocsPath,
    # The folder to write the help to, e.g. en-US of the module
    [Parameter(Mandatory)] [string] $OutputPath
)

Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'

Import-Module $PlatyPSPath
$null = New-ExternalHelp -Path $DocsPath -OutputPath $OutputPath -Force
