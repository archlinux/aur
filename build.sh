#!/usr/bin/env bash
set -e

export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true

## Restore
dotnet restore src/powershell-unix
dotnet restore src/ResGen
dotnet restore src/TypeCatalogGen

## Setup the build target to gather dependency information
targetFile="src/Microsoft.PowerShell.SDK/obj/Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets"
cat > $targetFile <<-"EOF"
<Project>
    <Target Name="_GetDependencies"
            DependsOnTargets="ResolveAssemblyReferencesDesignTime">
        <ItemGroup>
            <_RefAssemblyPath Include="%(_ReferencesFromRAR.HintPath)%3B"  Condition=" '%(_ReferencesFromRAR.NuGetPackageId)' != 'Microsoft.Management.Infrastructure' "/>
        </ItemGroup>
        <WriteLinesToFile File="$(_DependencyFile)" Lines="@(_RefAssemblyPath)" Overwrite="true" />
    </Target>
</Project>
EOF
dotnet msbuild src/Microsoft.PowerShell.SDK/Microsoft.PowerShell.SDK.csproj /t:_GetDependencies "/property:DesignTimeBuild=true;_DependencyFile=$(pwd)/src/TypeCatalogGen/powershell.inc" /nologo

## Generate 'powershell.version'
git --git-dir="$(pwd)/.git" describe --dirty --abbrev=60 > "$(pwd)/powershell.version"

## create the telemetry flag file
touch "$(pwd)/DELETE_ME_TO_DISABLE_CONSOLEHOST_TELEMETRY"

## Generate resource binding C# files
pushd src/ResGen
dotnet run
popd

## Generate 'CorePsTypeCatalog.cs'
pushd src/TypeCatalogGen
dotnet run ../System.Management.Automation/CoreCLR/CorePsTypeCatalog.cs powershell.inc
popd

## Build native component
pushd src/libpsl-native
cmake -DCMAKE_BUILD_TYPE=Debug .
make -j
popd

## Build powershell core
dotnet publish --configuration Linux "src/powershell-unix/" --output bin --runtime "linux-x64"
