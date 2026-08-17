# uyap-editor

AUR package for **UYAP Editor** (UYAP Doküman Editörü / Şablon Editörü): the closed-source word processor used with the Turkish National Judiciary Informatics System.

Upstream ships a Debian `.deb` inside a zip. This package extracts the JARs, installs Arch-style launchers, desktop entries, icons, and MIME types, and selects a Java 8 or 11 runtime (Java 17+ does not work).

- Upstream: <https://uyap.gov.tr/UYAP-Editor>
- Download host: <https://rayp.adalet.gov.tr/>
- Version: see `pkgver` in [`PKGBUILD`](PKGBUILD)

## Install

1. Install a compatible JRE (Java 11 preferred):

   ```bash
   sudo pacman -S jre11-openjdk
   ```

   Java 8 also works: `jre8-openjdk`.

2. Build and install from the AUR (`yay`, `paru`, or clone + `makepkg`):

   ```bash
   yay -S uyap-editor
   ```

   From this repository:

   ```bash
   makepkg -si
   ```

This package `provides` `uyap-editor-bin`, `replaces` `uyap-editor-bin` and `uyap`, and `conflicts` with `uyap-editor-bin`, `uyapeditor`, and `uyap`. Remove `uyapeditor` first if it is installed.

## Commands

| Command | Opens |
| --- | --- |
| `uyap-dokuman [file.udf]` | Document editor |
| `uyap-sablon [file.usf]` | Template editor |

Desktop entries: **UYAP Dokuman Editor** and **UYAP Sablon Editor**. Double-click `.udf` / `.usf` once MIME types are registered.

## Java runtime

The launchers **do not** use `/usr/bin/java` (that follows `archlinux-java` and is often 17+). They pick, in order:

1. `$UYAP_EDITOR_JAVA` if it is an executable
2. `/usr/lib/jvm/java-11-*/bin/java` (or `jre/bin/java`)
3. `/usr/lib/jvm/java-8-*/bin/java` (or `jre/bin/java`)

Override:

```bash
export UYAP_EDITOR_JAVA=/usr/lib/jvm/java-11-openjdk/bin/java
uyap-dokuman
```

## Optional dependencies

| Package | Why |
| --- | --- |
| `akia` | e-imza / AKİS smart-card login (pulls `pcsclite` and `ccid`) |
| `cups` | Printing |

The editor starts without them. Signing and printing need the matching package.

## Layout

| Path | Content |
| --- | --- |
| `/usr/bin/uyap-dokuman`, `/usr/bin/uyap-sablon` | Launchers |
| `/usr/share/java/uyap-editor/*.jar` | Upstream bytecode |
| `/usr/share/applications/uyap-editor-*.desktop` | Menu entries |
| `/usr/share/mime/packages/uyap-editor.xml` | `.udf` / `.usf` |
| `/usr/share/icons/hicolor/*/apps/uyap-editor.png` | Icons |
| `/usr/share/licenses/uyap-editor/LicenseRef-proprietary.txt` | Packager notice |

## Building

`base-devel` is assumed. The zip is listed in `source=()`; `makepkg` downloads it. `.gitignore` excludes `src/`, `pkg/`, zips, debs, `*.pkg.tar*`, and `*.src.tar.*`.

Regenerate metadata after PKGBUILD edits:

```bash
makepkg --printsrcinfo > .SRCINFO
```

License annotations:

```bash
reuse lint
```

## License

Two different licenses apply.

**Upstream software** (the JARs): no published license. The Ministry of Justice site footer is “Tüm Hakları Saklıdır” (all rights reserved). `PKGBUILD` uses `LicenseRef-proprietary`. [`LicenseRef-proprietary.txt`](LicenseRef-proprietary.txt) is a packager notice, not a grant. Bundled third-party libraries (JDOM, JAI, sqlite-jdbc, JNA, Apache FOP, and others) stay under their own terms.

**This repository** (PKGBUILD, launchers, desktop files, MIME XML, this README): [0BSD](LICENSE), with [REUSE](https://reuse.software/) annotations in [`REUSE.toml`](REUSE.toml). Required if the package is ever promoted to the official repos.

## Maintainer

Ismet Togay — see the `# Maintainer` line in `PKGBUILD`.
