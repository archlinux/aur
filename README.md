# rustdesk-hide-cm

An unofficial Arch Linux source package for RustDesk with optional connection-manager hiding restored in the Flutter UI. It uses the official RustDesk release source, the existing AUR `rustdesk` packaging patches, and a narrowly scoped visibility patch. Hardware-codec support is retained.

This directory is the root of the standalone GitHub repository. It is separate from the upstream RustDesk source checkout and the AUR repository, whose branch is `master`.

## Visibility behavior

The patch restores **Settings > Security > Password > Hide connection management window**. Hiding is disabled by default and requires all three conditions:

- `approve-mode = "password"`
- `verification-method = "use-permanent-password"`
- `allow-hide-cm = "Y"`

Unchecking the option restores an existing manager with connected clients. Changing either authentication mode through the UI to an incompatible value clears the option and restores the manager. The native authentication predicate remains authoritative for externally changed options as well.

Hiding the manager also hides its session controls. Closing the manager still disconnects its sessions. The package does not hide the tray icon, change authentication settings automatically, change rendezvous servers or ID validation, or install compositor rules or a background helper.

## Local build and installation

On an up-to-date Arch Linux `x86_64` system with `base-devel` installed, run as a regular user:

```bash
makepkg --syncdeps
```

To build and install instead:

```bash
makepkg --syncdeps --install
```

The package provides `rustdesk` and conflicts with other providers of that package. It does not declare `replaces`; pacman must confirm replacing an installed conflicting package. The binary and service names remain `rustdesk` and `rustdesk.service`.

**Finish active remote sessions before installation or upgrade.** The installation hook restarts an enabled `rustdesk.service`.

This is a Rust, Flutter, and vcpkg source build, not a repackaged official binary. It downloads a pinned Flutter SDK and codec sources and requires substantial build time and disk space. Source URLs remain upstream URLs. AOM and libyuv retain the original AUR recipe's `SKIP` checksums for the commit-specific GoogleSource archives; other declared sources and the visibility patch use the recorded checksums.

## GitHub Actions

`.github/workflows/aur-publish.yml` follows the two-job build/publication pattern used by `wegame-dwproton` and the direct SSH AUR publication pattern used by `ompweb`.

### Triggers and build

- Package-related pushes to `main`: build, then publish after success.
- Pull requests changing package files: build only; no publication secret is used.
- Manual **Run workflow**: build the selected branch; publish only when the selected branch is `main`.

The build job uses `archlinux:base-devel`, initializes the pacman signing keyring, updates its packages, creates an unprivileged builder, checks shell syntax and the committed `.SRCINFO`, and runs `makepkg --cleanbuild --force --syncdeps --noconfirm`. Only dependency installation through pacman is permitted through passwordless sudo inside the disposable build container.

After compilation it runs `namcap` on the main and debug packages, rejects package errors, verifies debug-package links against the main package in a combined extraction, checks the packaged executable's `--version`, and uploads the resulting `.pkg.tar.zst` files as a GitHub Actions artifact. The debug package's `symlink` rule is excluded from `namcap` because Arch `makepkg` creates build-id links to files in the companion main package; the combined extraction checks those targets instead. Other warnings remain visible but do not block publication. Flutter plugin `RUNPATH`s are set to `$ORIGIN` during packaging so they resolve the bundled engine instead of a writable build directory. This CLI check does not validate a graphical remote session or the hide/restore interaction.

### Publication setup

1. Create a GitHub repository with default branch `main`, using this directory as its repository root. Configure the secret below before the first package push.
2. Register a deployment public key with the AUR account that will maintain `rustdesk-hide-cm`. For an existing AUR package, the account must have maintainer or co-maintainer access.
3. In **Settings > Secrets and variables > Actions**, add the corresponding private key as the repository secret `AUR_SSH_PRIVATE_KEY`. Use the same non-interactive deployment-key setup as the other AUR repositories. Do not commit the key or paste it into issues or logs.
4. Push a package change to `main`, or manually run the workflow on `main`.

The publication job checks out the same GitHub commit that was built. It uses the existing maintainer identity `ParticleG <particle_g@outlook.com>`, a pinned AUR Ed25519 host key, and strict non-interactive SSH host verification. GitHub checkout credentials are not persisted; the workflow requires only `contents: read` permission.

Publication mirrors the following files into `ssh://aur@aur.archlinux.org/rustdesk-hide-cm.git` and pushes `HEAD:master`:

- `PKGBUILD` and the validated `.SRCINFO`
- `.gitignore` and this README
- Root-level `*.patch` files and `rustdesk.install`

The AUR checkout is treated as a packaging-only mirror: tracked files not in this list are removed. GitHub workflows, downloaded sources, build directories, and binary artifacts are not published to AUR. An unchanged recipe creates no commit. The first push can initialize an empty AUR package repository; authentication, host-key, and clone failures stop publication rather than falling back to a new local repository. No force push is used.

The workflow does not automatically bump upstream versions or rewrite checksums. AUR serves the build recipe, while binary build artifacts remain in GitHub Actions; no GitHub Release is created.

## Updating the package

`PKGBUILD` is authoritative. Review upstream version changes, the pinned `hbb_common`, Flutter and vcpkg versions, and patch applicability together. Packaging-only updates to a published version increment `pkgrel`.

After reviewing source and checksum changes, regenerate metadata:

```bash
makepkg --printsrcinfo > .SRCINFO
```

Commit `.SRCINFO` together with `PKGBUILD` and affected patches. The build job rejects stale metadata instead of silently changing the recipe during publication. This independently named package must be updated and rebuilt separately; regular repository updates to `rustdesk` do not update this variant.

## Attribution and validation scope

RustDesk is licensed under `AGPL-3.0-only`. The base recipe and compatibility patches come from the [AUR rustdesk package](https://aur.archlinux.org/packages/rustdesk), with their original contributor credits retained. The visibility patch changes only `src/ipc.rs`, `flutter/lib/models/server_model.dart`, and `flutter/lib/desktop/pages/desktop_setting_page.dart`; package documentation is not patched into upstream sources.

The original native GUI smoke validation used an isolated IPC backend, nested niri, and a demo connection card. It exercised default visibility, hide/restore transitions, authentication-mode restrictions, and option clearing without establishing a real remote desktop connection.
