# xpad-beitong-dkms 1.4-1

Source-only DKMS packaging of the existing Beitong GIP initialization workaround. Original patch: Zixing Liu; GCC/source acquisition bug reports: ilevnn (upstream PRs #3/#4). The independent successor fixes those paths without executing the contributor recipes. See SOURCES.md for immutable sources, signatures, checksums and attribution.

Supported exact x86_64 target releases:

- Official Arch linux: 7.3.4-arch1-2
- Official Arch linux-zen: 7.3.4-zen2-2-zen
- CachyOS: 7.3.4-1-cachyos, 6.18.60-2-cachyos-lts
- Previously validated CachyOS: 7.3.3-1-cachyos (not freshly rebuilt after its headers were removed)

Kernel headers and their matching compiler are required. Target .config selects GCC or Clang; explicit overrides remain available. Unknown releases are deliberately refused rather than compiled from an older/mismatched snapshot. Do not upgrade expecting the Beitong workaround on an unlisted kernel; ask for review/testing of that exact release first. A stock fallback is not equivalent to the workaround.

The package contains only source/configuration/provenance under /usr/src. There is no prebuilt .ko or .INSTALL. Standard Arch DKMS hooks own the package lifecycle; signing follows DKMS framework policy. No script explicitly reloads a live module. Review transaction logs and DKMS state; a pacman exit code alone does not prove every hook succeeded.

Official linux/linux-zen inputs and source tags were verified with the existing Arch keyring. Controlled-root actual install, upgrade, legacy 1.0-1 migration and removal passed on the four currently available targets; stock files restored exactly. This is not a live kernel-load test, production Secure Boot/signature acceptance test or full physical-controller test. KP70C1 support remains unverified; no new device ID/quirk was guessed.

Upstream project: https://github.com/675076143/xpad-beitong-dkms
Candidate implementation: af6f96e33fa18700a695a5a4e98d7a26ea373ed6
