# Writes the pwsh.deps.json of PowerShell: the one it's built with, plus the libraries other packages add
# to it with fragments, e.g. Microsoft.Management.Infrastructure, which PowerShell is built without. The
# .NET host only loads the assemblies the deps.json lists, PowerShell doesn't look for others in $PSHOME.
# Run by the powershell-deps pacman hook, through update-pwsh-deps.
param(
    # The deps.json PowerShell is built with
    [Parameter(Mandatory)] [string] $BaseDepsPath,
    # The folder of the fragments (*.json), each in the format of a deps.json with the libraries' targets
    # and libraries entries. Their assemblies are installed in $PSHOME.
    [Parameter(Mandatory)] [string] $FragmentPath,
    # The deps.json to write
    [Parameter(Mandatory)] [string] $OutputPath
)

Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'

$deps = Get-Content -Raw -LiteralPath $BaseDepsPath | ConvertFrom-Json -AsHashtable
$target = $deps['targets'][$deps['runtimeTarget']['name']]

$fragments = @(Get-ChildItem -File -LiteralPath $FragmentPath -Filter '*.json' -ErrorAction SilentlyContinue | Sort-Object Name)
foreach ($fragment in $fragments) {
    $fragmentDeps = Get-Content -Raw -LiteralPath $fragment.FullName | ConvertFrom-Json -AsHashtable
    foreach ($fragmentTarget in $fragmentDeps['targets'].Values) {
        foreach ($library in $fragmentTarget.GetEnumerator()) {
            # PowerShell's own libraries always win
            if ($target.ContainsKey($library.Key)) {
                Write-Warning "$($fragment.Name): PowerShell already has $($library.Key), skipped"
                continue
            }
            $target[$library.Key] = $library.Value
            $deps['libraries'][$library.Key] = $fragmentDeps['libraries'][$library.Key]
        }
    }
}

# Written next to the output first, so pwsh never sees a partially written file
$temporaryPath = "$OutputPath.new"
$deps | ConvertTo-Json -Depth 100 | Set-Content -LiteralPath $temporaryPath -Encoding utf8NoBOM
Move-Item -LiteralPath $temporaryPath -Destination $OutputPath -Force
"Added the libraries of $($fragments.Count) fragment(s) to $OutputPath"
