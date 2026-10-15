# macos-sequoia-fonts

Arch package recipe for macOS Sequoia **15.8.1 / 24H32**, Apple's public SF families and New York. The build recipe and its single Python helper use the same flat layout locally and on AUR.

## Project layout

```text
PKGBUILD / .SRCINFO        Package metadata and installation
macos_sequoia_fonts.install Installation/upgrade license reminder
build_fonts.py            Complete build, extraction, filtering and validation pipeline
extract_font_files.c      Apple Archive font extractor source
NOTICE.txt                Package notice
```

All Python helper logic lives in `build_fonts.py`. The small native extractor stays in `extract_font_files.c` and is compiled with GCC into the temporary build directory. Python manages subprocesses, metadata, font names, TSV inventories, hashes and HTTP ZIP ranges. `PKGBUILD` and the pacman install script remain shell files as required by their interfaces. `docker/`, `.dockerignore`, `docker-out/`, `src/`, `pkg/`, temporary build directories and package archives are excluded from Git. There is no checked-in `data/` directory or font checksum snapshot.

## Downloads

| Source | Files | Purpose |
| --- | --- | --- |
| Apple Developer CDN | `SF-Pro.dmg`, `SF-Compact.dmg`, `SF-Mono.dmg`, `SF-Arabic.dmg`, `SF-Armenian.dmg`, `SF-Georgian.dmg`, `SF-Hebrew.dmg`, `NY.dmg` | Public SF/New York fonts and installer licenses |
| [Apple Sequoia font page](https://support.apple.com/en-ie/120414) | Current HTML, parsed during every build | Installed/downloadable and document-support font lists |
| [Apple Font7 catalog](https://mesu.apple.com/assets/macos/com_apple_MobileAsset_Font7/com_apple_MobileAsset_Font7.xml) | Current XML plist, downloaded during every build | Asset URLs, sizes, SHA1 measurements and font-name metadata |
| Apple Font7 CDN | ZIP assets matching non-Noto names in the webpage lists | Selected downloadable fonts; not the entire catalog |
| Apple Sequoia OTA CDN | 19 font-bearing members of the fixed 15.8.1 / 24H32 OTA ZIP | Fonts embedded in the system image |
| GitHub | Fixed commits of `libNeoAppleArchive`, `lzfse` and `libzbitmap` | Compile the Apple Archive extractor with GCC |

All eight DMGs use `https://devimages-cdn.apple.com/design/resources/download/<filename>`. The three Git URLs and commits are in `PKGBUILD`. Mutable Apple downloads have no stored SHA256 pins. Font7 archives are checked against sizes and SHA1 measurements from the freshly downloaded Apple catalog. The catalog's signature is not independently verified.

The [fixed Sequoia OTA URL](https://updates.cdn-apple.com/2026FallFCS/ad22d07e-0d68-4679-9375-99a5c4fc95ae/com_apple_MobileAsset_MacSoftwareUpdate/a30f5f5e5659a0760382124bee535d7ac33cb51f.zip) and its 19 font-bearing member numbers are recorded in `build_fonts.py`. It uses HTTP Range to read ZIP members without downloading the complete 15.6 GB archive. `SEQUOIA_OTA_ZIP` can reuse a complete local ZIP. ZIP CRC, member size and PBZX decoded sizes are checked; no payload SHA snapshot is retained. Changing to a different OTA build requires updating its URL and member selection.

Current website lists and catalog are written to `src/metadata/` during the build. Selection prefers newer catalog mastering metadata for each matching name and never subtracts fonts already present in the image. No Font8 assets are used. Changes to Apple's page/catalog can change the resulting fonts; unexpected missing coverage causes the build to fail.

## Processing

1. Download the eight DMGs and three extractor source repositories; compile the C extractor with GCC.
2. Read and decompress the selected OTA payloads. Extract only:
   - `/System/Library/Fonts/`, including `Supplemental`.
   - `/System/Library/PrivateFrameworks/FontServices.framework/Versions/A/Resources/Fonts/ApplicationSupport/`.
   Application bundles, other frameworks, `Subsets` and `Reserved` are excluded.
3. Fetch the webpage lists and Font7 catalog, select matching assets, download and verify them, and unpack their fonts.
4. Extract the Developer DMGs with 7-Zip and their signed XAR packages/payloads with `bsdtar`; preserve fonts and English licenses.
5. Remove Noto, SFNS and private-only files. Remove Font7 files with no actual names matching the website lists. Fontconfig hides internal faces and aliases in mixed collections, including dot-prefixed names, PUA and localized “System Font” names.
6. Deduplicate **only Font7**, using face names and Unicode cmap inclusion. Equal coverage prefers newer versions. Whole files are removed only when all public faces have replacements; otherwise Fontconfig hides redundant Download faces.
7. Organize the four directories below; flatten Download and disambiguate basename collisions with asset IDs. Preserve retained font bytes.
8. Check actual font names against both webpage lists, verify file preservation, and package fonts, Fontconfig rules, licenses and exactly two TXT lists.

```text
/usr/share/fonts/macos-sequoia/
├── Platform/       # Official SF/New York downloads
├── Download/       # Selected Font7 fonts, deduplicated internally, flat
├── Library/        # Image /System/Library/Fonts
└── FontServices/   # Image FontServices ApplicationSupport

/usr/share/doc/macos-sequoia-fonts/
├── installed-downloadable-fonts.txt
└── document-fonts.txt
```

Library, FontServices and Platform are preserved independently. Source priorities are left to the user's Fontconfig. Catalogs, deduplication reports, inventories, coverage reports and this README are not installed. The two installed TXT files reproduce Apple's lists, including Noto entries that are excluded from the package.

## Build

```sh
makepkg -s
```

An optional local Docker workflow, excluded from Git, is available in this workspace:

```sh
./docker/build.sh
# Or reuse a local OTA ZIP:
SEQUOIA_OTA_ZIP=/path/to/sequoia.zip ./docker/build.sh
```

It builds in Arch Docker, validates the extracted package and exports the package plus installation tree to `docker-out/`. It checks coverage, exclusions, Fontconfig visibility, licenses, documentation layout and file preservation. Previous successful output is backed up after validation. It does not install fonts on the host.

The Docker script automatically reuses the previously downloaded OTA ZIP under `~/.cache/mac-font-probe-tahoe/macos-15.8.1/` if available; otherwise it uses HTTP Range.

Caches default to `${XDG_CACHE_HOME:-$HOME/.cache}`:

- `macos-sequoia-fonts-assets/`: Font7 archives, checked against current catalog measurements; override with `FONTCACHE`.
- `macos-sequoia-fonts-src/`: Docker DMG/Git cache; override with `SRCDEST`. To refresh a cached Developer DMG, remove its cached copy before rebuilding.
- `macos-sequoia-fonts-validation/`: build-only references and fetched metadata for package validation.
- `macos-sequoia-fonts-backups/`: previous outputs and source refactoring backups.

## Licenses

Installer licenses and `NOTICE.txt` are installed under `/usr/share/licenses/macos-sequoia-fonts/`. Installation and upgrades display the license locations and require a terminal confirmation: type exactly `ACCEPT` after reading and accepting the applicable terms, or `DECLINE`. `--noconfirm` does not bypass this prompt. No acceptance is assumed without input; an absent terminal or refusal produces a scriptlet error. Pacman does not roll back files after a scriptlet error, so declining users must not use the fonts and should remove the package. Confirmation does not grant rights beyond the licenses.

Only the recipe and helper source code are published to AUR; font binaries and downloaded installer licenses are not uploaded.
