# pjecalc-cidadao-bin

Arch Linux packaging files for PJe-Calc Cidadao.

This repository does not contain the upstream application binaries. The package is built from:

- The official PJe-Calc Cidadao Windows installer published by TRT8
- An official Eclipse Temurin JRE 8 build for Linux

## What this package does

- Downloads the official upstream Windows installer during `makepkg`
- Extracts the application payload from the installer
- Bundles a Linux Java 8 runtime so the application runs on Arch
- Installs the packaged files under `/opt/pjecalc-cidadao`
- Runs the application from `~/.local/share/pjecalc-cidadao/app` so user data stays writable

## Why bundle Java 8

PJe-Calc Cidadao depends on older Java and Tomcat behavior and does not run correctly on current system Java releases such as OpenJDK 21 or 25. This package uses Temurin JRE 8 to keep runtime behavior compatible.

## Build

```bash
makepkg -si
```

## Installed files

- Launcher: `/usr/bin/pjecalc-cidadao`
- Desktop entry: `/usr/share/applications/pjecalc-cidadao.desktop`
- Packaged app template: `/opt/pjecalc-cidadao/app-dist`
- User runtime state: `~/.local/share/pjecalc-cidadao`

## Upstream

- Page: <https://www.trt8.jus.br/pjecalc-cidadao/instalando-o-pje-calc-cidadao>
- Installer: <https://www.trt8.jus.br/sites/portal/files/roles/pje-calc/pjecalc-2.15.1-instalador-x64.exe>

## Notes

- Do not commit the extracted upstream files, the downloaded installer, or built package artifacts to this repository.
- Regenerate `.SRCINFO` after any `PKGBUILD` change:

```bash
makepkg --printsrcinfo > .SRCINFO
```
