#!/usr/bin/bash

rm -rf */ || true
rm *.tar* || true
dotnet clean || true
git clean -f || true
git reset --hard || true
