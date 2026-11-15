# Source provenance and review

## Current exact-release snapshots

All three vendored files are unmodified official stable sources and byte-identical to the corresponding CachyOS source-tag file. The package prepares a clean, separately patched copy of each. No package/DKMS build downloads source.

| File | Official stable commit | CachyOS source tag / commit | Git blob | SHA-256 |
|---|---|---|---|---|
| `xpad-linux-7.3.3.c` | `d50d994bffa3c7c6db2d8bc4c5f0c55e3f46b0cd` | `cachyos-7.3.3-1` / `1d4761de576fb0c50f9b9646c276811a67a173ad` | `810e52782ae891f3273598474b66ac89db13a6c8` | `b47281151829fc382c4bcb5f466865f476a6f4ebfacd617ee49393f99c1e3950` |
| `xpad-linux-7.3.4.c` | `7595a62d45ee1a2297eafa5f2ef5d0a45142d84d` | `cachyos-7.3.4-1` / `779ca9af71579431ca932a13a7c2ed5934b289ad` | `d2eb48d98fead7d89eb3e45613a52176c4fa5fad` | `d3d9500cac4a59aad0a6bfe1d064e5a4c16cfc18d928f4bf6f69f6fd51511176` |
| `xpad-linux-6.18.60.c` | `f45ed76d6791cf72ff1265ee93511175bbbc2f18` | `cachyos-6.18.60-1` / `d98939f3daa1a8553dbea002aab392c970c9a7a7` | `126f99cd0b29ea23099a24cac3aebe63aab1dcf1` | `a82cdcd930f7e9528ca645d68ade181531d2ac4de1e3e8395e7935945a3bb92e` |

For each commit the path is `drivers/input/joystick/xpad.c` in `gregkh/linux` or `CachyOS/linux`. Immutable references:

- [Official 7.3.3 source](https://github.com/gregkh/linux/blob/d50d994bffa3c7c6db2d8bc4c5f0c55e3f46b0cd/drivers/input/joystick/xpad.c)
- [CachyOS 7.3.3 source](https://github.com/CachyOS/linux/blob/1d4761de576fb0c50f9b9646c276811a67a173ad/drivers/input/joystick/xpad.c)
- [Official 6.18.60 source](https://github.com/gregkh/linux/blob/f45ed76d6791cf72ff1265ee93511175bbbc2f18/drivers/input/joystick/xpad.c)
- [CachyOS 6.18.60 source](https://github.com/CachyOS/linux/blob/d98939f3daa1a8553dbea002aab392c970c9a7a7/drivers/input/joystick/xpad.c)

Local `git hash-object` matches all six independently fetched file responses. GitHub reports valid signatures on all six release-tag objects; this is server-reported verification, not local GPG verification. GPL-2.0-or-later identifiers remain intact. No upstream/fork build scripts were executed.

The read-only CachyOS package recipes map installed version `7.3.3-1` to source tag `cachyos-7.3.3-1`, and `6.18.60-2` to source tag `cachyos-6.18.60-1` (`pkgrel=2` is not the source tag suffix). Recipe revisions reviewed: `6d02fae52812f9c836abffb4a5320aee9e07a294` and `3473896702e3579493c7fa5aac17d797dd392e89`, respectively, in `CachyOS/linux-cachyos`. Their original blobs are `9f53eefe72cc7d52f763841388669388170dff4b` and `fe9c5b1de8bed18dd6730c5de79f866696790ec2`. Installed packages are the znver4 variants; their cached `.BUILDINFO` hashes differ from the generic recipes, so this review does not claim a cryptographic reconstruction of the installed binary from the generic recipe. It establishes exact released source identity, not decompilation of installed modules.

## Why the earlier source strategy was rejected

Commit `9e626f4` is preserved. It pinned official Linux v6.18 (`7d0a66e4bb9081d75c82ec4957c50034cb0ea449`, blob `d72e89c25e5031cb4b9636258aff44cbed263137`), which compiled on both headers but predates stock fixes. The initially reviewed 7.3.3 and 6.18.60 releases add a Share-button report-length check before `data[len - offset]`, correct PDP `0e6f:0147` from Xbox One to Xbox 360, and add 23 device IDs. The 7.3.3 file also has RedOctane vendor matching and `kzalloc_obj` conversions. Compilation cannot detect these semantic regressions. That package must not replace newer stock xpad generally.

## Local patches and target selection

Repository base: `f4ce639f8f2e88ff3f8fbca75c3e5ce9b6857169`. Its GIP patch is attributed to Zixing Liu. The three `beitong-linux-*.patch` files rebase only that reviewed repository's packet bytes, original 28-device quirk list and GIP logic onto each exact stock snapshot. The stock `5134` and `514a` entries are replaced by flagged entries rather than duplicated. Existing `20bc` USB interface matching is retained; no extra vendor match, KP70C1 quirk, XUSB request or HID receiver driver is added. All stock device IDs and packet-length protection remain.

DKMS's regex and Makefile's source map permit only `7.3.3-1-cachyos`, `7.3.4-1-cachyos` and `6.18.60-2-cachyos-lts`. The wrapper verifies the header release equals KVER before copying the matching local source to `xpad.c`; unknown or mismatched targets fail. There is no download, glob-based source search, major-version fallback or old source default. Header configuration still selects compiler, with explicit overrides retained. A future target needs a new source review and build, not just a widened regex.

## Issue and PR decisions

- [PR #3](https://github.com/675076143/xpad-beitong-dkms/pull/3), head `2872f20c71ee8992c7f34fa323bb9d35da44bb63`: accepted the bug report that forced LLVM breaks GCC targets. Did not execute or merge its recipe. Removing LLVM alone breaks Clang targets, and its DKMS configuration still forces LLVM. The new common wrapper selects against target headers instead.
- [PR #4](https://github.com/675076143/xpad-beitong-dkms/pull/4), head `13ce1da110d3023ec16189dd03feedb5f44abae2`: accepted that headers may omit `.c` files. Did not execute its recipe. Replaced host-dependent fetching/search with a pinned local source, checksums and clean preparation. No network fallback is needed.
- [Issue #1](https://github.com/675076143/xpad-beitong-dkms/issues/1): reviewed the external EvernightFedora fork as text only. Reviewed blobs: `90-beitong-support.patch` (`3324f57f5d477c2d8942e2253ca0eb8b3410ecb8`), `90-beitong-support-rtm.patch` (`b552c13c3942eb38bf801da9a6b781d22f95b86c`), `95-betop-devid.patch` (`78121c0c9beb0b5cd2363778111b0d6252f44700`), `xpad-kp40d.patch` (`1748cd86097690f12fb098f6aa98a8d35bf2c688`), and `PKGBUILD` (`3fc7109feb46baf6be7fc22aa80d3338192265ac`). The fork contains both an older GIP approach and newer `FLAG_READ_XUSB10` vendor-descriptor handling. Its KP40D HID receiver match is `20dd:515c`, not evidence for `20dd:518b`. One patch removes an unrelated EasySMX ID; copyright preambles also warrant licensing clarification before reuse. No fork code was imported or executed.
- [Issue #2](https://github.com/675076143/xpad-beitong-dkms/issues/2): reporter's KP70C1 Mint is idle `20dd:518b`, active `20bc:518b`; adding an ID manually did not fix it. The fork's active `518b` entry opts into XUSB descriptor handling, a different mechanism from this GIP quirk. The issue alone does not justify applying either mechanism. Leave hardware support open; request active descriptors/logs and a controlled device test before proposing a separate device patch.

## Package lifecycle

The installed Arch/CachyOS DKMS 3.4.4 package provides `70-dkms-install.hook`, `70-dkms-upgrade.hook`, `71-dkms-remove.hook` and `/usr/share/libalpm/scripts/dkms`. Those hooks trigger on `/usr/src/*/dkms.conf` and handle lifecycle operations. The removed custom install script duplicated DKMS work, discarded errors and loaded/unloaded the live driver. The replacement has no install script or modprobe settings. Obsolete `CLEAN` and `REMAKE_INITRD` directives are omitted for current DKMS; manual `make clean` remains available via the same target-aware wrapper.

## 7.3.4 extension — 2026-11-15

The exact CachyOS recipe at `8e308d0a3895dbc741381fb61b9a9a8603be793d` (`linux-cachyos/PKGBUILD`, blob `4c13ff2a479d4226d84676024c98464b256931b4`) sets 7.3.4, pkgrel 1, source tag `cachyos-7.3.4-1`. The installed signed headers package is `linux-cachyos-headers 7.3.4-1`, with matching `version` and `include/config/kernel.release`. The source tag resolves to `779ca9af71579431ca932a13a7c2ed5934b289ad`; its xpad blob matches official stable commit `7595a62d45ee1a2297eafa5f2ef5d0a45142d84d`. Immutable paths:

- [CachyOS 7.3.4 xpad](https://github.com/CachyOS/linux/blob/779ca9af71579431ca932a13a7c2ed5934b289ad/drivers/input/joystick/xpad.c)
- [Official stable 7.3.4 xpad](https://github.com/gregkh/linux/blob/7595a62d45ee1a2297eafa5f2ef5d0a45142d84d/drivers/input/joystick/xpad.c)

A complete 7.3.3 → 7.3.4 xpad diff contains exactly one added device-table row: GameSir Nova Lite `3537:1040`, Xbox 360 type. No existing stock code or Beitong mechanism changes. This row remains in the new source. The reviewed 7.3.3 GIP patch applied at zero fuzz, with one-line offsets after the stock addition; the saved 7.3.4 patch is regenerated against its exact base. No contributor/fork recipe is executed and no new device quirk is enabled. Prior 7.3.3/LTS sources and patches are byte-unchanged from `5b0cb17`. See VALIDATION-7.3.4.md for the compiler patch-version warning and current test limits.

## Official Arch/linux-zen verification — 2026-11-15

The exact signed packages are `linux`/`linux-headers 7.3.4.arch1-2` and `linux-zen`/`linux-zen-headers 7.3.4.zen2-2`. All four detached package signatures verify locally against the installed, signature-validated Arch keyring (`archlinux-keyring 1:20260909-1`). The public armored keyring was decoded only into the workspace, not modified/imported into host state. The accepted signing fingerprint is `83BC8889351B5DEBBB68416EB8AC08600F108CDF`; bad, expired or revoked verification statuses are rejected. No key was downloaded, generated or trusted ad hoc.

The signed kernel packages' `.BUILDINFO` authenticates the retrieved official GitLab PKGBUILD bytes: SHA-256 `6c6decdb714b5e50108d8c66e156b37a16e57f9dbaaba0151fe452a20867d927` for linux and `52fc94e296d39305e5770c7da85cbfd2feb20df3d0156b7157969cbbbfde700a` for linux-zen. Those recipes name the source release tags and accepted packager key. Recipes were read as text, not executed.

Official source Git tags were fetched into isolated bare repositories without checkout. Their raw annotated-tag payloads were independently verified locally with the same trusted Arch keyring and exact fingerprint. Git object hashes connect each verified tag to its target commit and tree:

| Official source tag | Commit | `drivers/input/joystick/xpad.c` blob |
|---|---|---|
| `archlinux/linux v7.3.4-arch1` | `7bcd7458738c37c15864fa5cc1ffc4f21905e087` | `d2eb48d98fead7d89eb3e45613a52176c4fa5fad` |
| `zen-kernel/zen-kernel v7.3.4-zen2` | `f18219c1624ecbe082f05aca073d6555eee91a2d` | `d2eb48d98fead7d89eb3e45613a52176c4fa5fad` |

The existing pinned `xpad-linux-7.3.4.c` has that exact Git blob, so both distro sources are byte-identical to the reviewed 7.3.4 file. No new copy or unverified source is needed; both target aliases select this proven source and the same reviewed GIP patch. Signed headers give exact releases `7.3.4-arch1-2` and `7.3.4-zen2-2-zen`, both GCC 16.2.1 / BFD / no LTO. These target names come from verified headers, not guesses from package filenames. Original CachyOS mappings and source hashes remain unchanged, and unknown releases still fail closed.

PR #3/#4 were filed by `ilevnn` and are retained as credited bug reports. Their exact raw heads remain unsafe to merge as-is; the independently implemented follow-up keeps their reporting attribution and Zixing Liu's patch attribution without claiming their recipes were executed or copying their unchecked download behavior.
