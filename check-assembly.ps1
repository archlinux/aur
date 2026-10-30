# Checks that Microsoft.Management.Infrastructure loads with the identity and the types PowerShell and
# modules built against it expect. Its tests need the OMI server and client library.
param(
    # The built assembly
    [Parameter(Mandatory)] [string] $Path
)

Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'

$name = [System.Reflection.AssemblyName]::GetAssemblyName($Path)
if ($name.Name -ne 'Microsoft.Management.Infrastructure' -or $name.Version -ne [version]'2.0.0.0') {
    throw "Unexpected assembly identity $($name.FullName)"
}

$assembly = [System.Reflection.Assembly]::LoadFile($Path)
$types = $assembly.GetExportedTypes().FullName
foreach ($type in 'CimClass', 'CimConverter', 'CimInstance', 'CimSession', 'CimType') {
    if ("Microsoft.Management.Infrastructure.$type" -notin $types) {
        throw "Microsoft.Management.Infrastructure.$type is missing"
    }
}
"$($name.FullName): $($types.Count) public types"
