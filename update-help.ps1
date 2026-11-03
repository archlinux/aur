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

# The containers of the updatable help of modules whose HelpInfoUri doesn't lead to theirs. PSResourceGet's
# fwlink (https://go.microsoft.com/fwlink/?linkid=2238183), also the HelpContentURI of its HelpInfo.xml on
# the server since the help was published again on 2026-10-28, redirects to its documentation page now,
# so Update-Help fails for it. Its help is taken from the container directly instead.
# Upstream issue: https://github.com/PowerShell/PSResourceGet/issues/2078
$helpContainers = @{
    'Microsoft.PowerShell.PSResourceGet' = 'https://pshelpprod.z22.web.core.windows.net/powershellget-3.x/'
}

Update-Help -Module $modules -UICulture en-US -Scope AllUsers -ErrorAction SilentlyContinue -ErrorVariable helpErrors
foreach ($helpError in $helpErrors) {
    $failed = @($modules | Where-Object { $helpContainers.ContainsKey($_) -and $helpError.Exception.Message.Contains("'$_'") })
    if (-not $failed) {
        throw $helpError
    }
    foreach ($name in $failed) {
        # What Update-Help installs: the cab of the help, <module>_<GUID>_en-US_HelpContent.cab, unpacked
        # into the module's en-US folder, and next to the module the HelpInfo.xml with the version installed,
        # which Update-Help saves with the line endings of the system
        $module = Get-Module -ListAvailable -Name $name | Select-Object -First 1
        $helpName = "$($name)_$($module.Guid)"
        $helpInfo = Join-Path $module.ModuleBase "$($helpName)_HelpInfo.xml"
        Invoke-WebRequest -Uri "$($helpContainers[$name])$($helpName)_HelpInfo.xml" -OutFile $helpInfo
        $helpInfoText = [System.IO.File]::ReadAllText($helpInfo) -replace "`r`n", "`n"
        [System.IO.File]::WriteAllText($helpInfo, $helpInfoText, [System.Text.UTF8Encoding]::new($true))
        $cab = Join-Path ([System.IO.Path]::GetTempPath()) "$($helpName)_en-US_HelpContent.cab"
        Invoke-WebRequest -Uri "$($helpContainers[$name])$(Split-Path -Leaf $cab)" -OutFile $cab
        $helpDir = New-Item -ItemType Directory -Force -Path (Join-Path $module.ModuleBase en-US)
        bsdtar -xf $cab -C $helpDir
        if ($LASTEXITCODE -ne 0) {
            throw "Unpacking the help of $name failed"
        }
        Remove-Item -LiteralPath $cab
    }
}

# The help of Microsoft.PowerShell.Core goes into $PSHOME of the running PowerShell
if ((Resolve-Path -LiteralPath $PowerShellHome).Path -ne (Resolve-Path -LiteralPath $PSHOME).Path) {
    $coreHelp = New-Item -ItemType Directory -Force -Path (Join-Path $PowerShellHome en-US)
    Copy-Item -Recurse -Force -Path (Join-Path $PSHOME en-US/*) -Destination $coreHelp
}
