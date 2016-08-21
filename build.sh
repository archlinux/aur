#!/usr/bin/env bash

pushd src/ResGen
dotnet run -c Linux
popd

pushd src/TypeCatalogParser
dotnet run -c Linux
popd

pushd src/TypeCatalogGen
dotnet run -c Linux  ../Microsoft.PowerShell.CoreCLR.AssemblyLoadContext/CorePsTypeCatalog.cs powershell.inc
popd

cd src/powershell-unix
dotnet build -c Linux
dotnet publish

# vim:set ts=2 sw=2 et:
