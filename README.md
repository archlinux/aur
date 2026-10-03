# CaptureAge for Arch Linux

Unofficial AUR packaging of CaptureAge:DE 1.26.0.
Upstream ships an x86-64 Windows application. This package extracts
the official offline payload to `/opt/captureage` and launches it with
Protontricks in Age of Empires II: Definitive Edition's Steam prefix
(App ID `813780`). Linux compatibility depends on your Proton version;
the packaged launcher has not been tested in a live game session.

## Build and install

Read the [CaptureAge terms](https://captureage.com/terms) before using
the application. You must own Age of Empires II: Definitive Edition.
Core features are free; some features require an upstream subscription.

```sh
git clone https://github.com/Firstp1ck/captureage-bin.git
cd captureage-bin
makepkg -si
```

`makepkg` downloads a specific release from CaptureAge and verifies its
SHA-256 checksum. The build and package functions only extract and copy
files; they do not run Windows binaries or modify a Wine/Proton prefix.

## First launch

1. Install AoE II: DE with native Arch Steam, select a recent Proton version
   in the game's Compatibility settings, and launch the game at least once.
2. Keep Steam open. Start the game, then launch **CaptureAge** from the
   application menu or run `captureage` in a terminal.
3. If CaptureAge cannot find the game assets, select the actual `AoE2DE`
   installation directory in its settings. Wine's `Z:` drive exposes Linux
   paths, for example
   `Z:\home\YOUR_USER\.local\share\Steam\steamapps\common\AoE2DE`.
   Use the actual library path if the game is on another drive.

To enable the in-game **Spectate with CA** button, close the game and run:

```sh
captureage --register
```

This imports the included registry file into the current user's AoE II
Proton prefix. It registers the packaged executable and `captureage://`
protocol. It is optional and must be repeated for a new prefix. If you
also want browser `captureage://` links to open the Linux launcher:

```sh
xdg-mime default captureage.desktop x-scheme-handler/captureage
```

`aoe2de://` links use the game's separate `AOEURLHelper.exe` and are not
handled by this launcher.

## Custom Steam installations and troubleshooting

Protontricks discovers Steam libraries and the game's selected Proton
version. Its standard overrides apply, for example:

```sh
STEAM_DIR='/path/to/Steam' captureage
PROTON_VERSION='Proton - Experimental' captureage
STEAM_COMPAT_DATA_PATH='/path/to/compatdata/813780' captureage
```

Use the same overrides for `captureage --register` if necessary. This
package targets native Steam and native Protontricks; Flatpak Steam needs
separate sandbox permissions and is not covered by these launch commands.

If a missing Visual C++ runtime error occurs, close the game and install
the runtime in its prefix with `protontricks 813780 vcrun2022`. Older
setups may need `protontricks 813780 d3dcompiler_47` or Windows 10 selected
with `protontricks 813780 winecfg`. Apply these only when troubleshooting
the corresponding issue: they change the game's shared prefix.

Update the system installation through the AUR package. CaptureAge's own
Windows updater cannot replace root-owned files in `/opt/captureage`.
User settings remain in the game's Proton prefix. Removing the package
does not remove those settings or the optional per-user registry entries.

## Maintaining and submitting to AUR

The package name is `captureage-bin` because upstream distributes binaries.
Only commit packaging files to AUR. CaptureAge's terms prohibit
redistribution of the application; do not upload the downloaded archive
or built binary package. The recipe fetches the payload from upstream.

For a new release, update `pkgver`, reset `pkgrel` to `1`, update the
upstream archive checksum and the release information above, then run:

```sh
updpkgsums
makepkg --printsrcinfo > .SRCINFO
makepkg --verifysource --force
makepkg --force
namcap PKGBUILD captureage-bin-*.pkg.tar.zst
```

Use the version-specific API URL in `PKGBUILD`. The `/latest` endpoint
changes over time, and direct Azure CDN redirects contain tokens that
expire after about 15 minutes. The version-specific API returns a fresh
redirect for the requested filename.

## GitHub and AUR automation

This is one source repository for both destinations:

- GitHub `main` contains packaging, maintenance scripts, tests and workflows.
- AUR `master` contains only `PKGBUILD`, `.SRCINFO`, the launcher, desktop
  entry, registry file, license and this README. Its Git history is preserved.

[Update and publish CaptureAge](https://github.com/Firstp1ck/captureage-bin/blob/main/.github/workflows/update.yml) runs daily at
03:17 UTC and can also be started from GitHub's Actions tab. On a new upstream
release it downloads the exact version, checks the version inside the archive,
updates `pkgver`, resets `pkgrel` to `1`, recalculates every source checksum,
updates this README and regenerates `.SRCINFO` with Arch's `makepkg`.

Every run validates the source checksums, builds the package as a non-root
user in Arch Linux, checks metadata, runs the updater/publisher tests, and
lints the launcher and desktop entry. The build skips runtime dependency
installation because it only repackages files and does not run the app.
`namcap` warnings about no ELF binaries and dynamically invoked dependencies
are expected for the Windows payload; errors fail validation.

After validation, a separate job commits updates to GitHub and pushes the
packaging files to AUR. It retries the AUR sync even when the upstream
version is unchanged, so a failed AUR push can recover on the next run.
Normal pushes to `main` also validate and publish manual package changes.
Pull requests run validation only. Pushes made by `GITHUB_TOKEN` do not
trigger another workflow, so the scheduled job publishes directly.

### Initial setup

1. Create `Firstp1ck/captureage-bin` on GitHub and push this directory as its
   `main` branch. Use a separate Git repository for this directory.
2. Register a publishing SSH public key in your AUR account (`Firstpick`).
   The corresponding private key must work without an interactive passphrase.
3. Add these GitHub Actions repository secrets:
   - `AUR_SSH_PRIVATE_KEY`: the private key registered with AUR.
   - `AUR_KNOWN_HOSTS`: the trusted `aur.archlinux.org` SSH host-key entries.
4. Enable Actions. Run **Update and publish CaptureAge** manually once to
   create/synchronize the AUR package. Future runs are automatic.

For an existing local AUR SSH setup, the secrets can be uploaded without
printing the private key:

```sh
gh secret set AUR_SSH_PRIVATE_KEY --repo Firstp1ck/captureage-bin < ~/.ssh/aur
ssh-keygen -F aur.archlinux.org -f ~/.ssh/known_hosts |
  gh secret set AUR_KNOWN_HOSTS --repo Firstp1ck/captureage-bin
```

Only use a key whose public half is registered to the account that owns or
co-maintains `captureage-bin`. The workflow never force-pushes AUR and refuses
to replace a newer version already there. If AUR has a newer manual update,
incorporate it into GitHub before rerunning publishing. If GitHub rejects a
push because its branch changed, the run stops and the next run starts fresh.

GitHub schedules run on the default branch, can be delayed, and may be
disabled after 60 days without repository activity in public repositories.
Keep Actions enabled and check failed-run notifications. Branch protection
must allow the workflow's `GITHUB_TOKEN` to push updates to `main`.

### Local maintenance

```sh
python3 tools/update.py --check   # Read-only upstream version check
python3 tools/update.py           # Prepare an available upstream update
bash tools/validate.sh            # Validate and build on Arch Linux
python3 tools/publish_aur.py --dry-run
python3 tools/publish_aur.py       # Publish using your local AUR SSH setup
```

For launcher, desktop, registry or documentation changes without an upstream
version change, increment `pkgrel`, run `updpkgsums`, regenerate `.SRCINFO`,
and commit the changes to `main`. The daily updater keeps your `pkgrel` when
no newer upstream version exists. Upstream license changes require a manual
review and update of `LICENSE`.

## Research sources

Checked October 3, 2026:

- [Official download and offline installer](https://captureage.com/cade/get)
- [Official release notes](https://captureage.com/cade/updates)
- [Official documentation](https://captureage.com/cade/docs)
- [CaptureAge terms and conditions](https://captureage.com/terms)
- [Protontricks usage and environment variables](https://github.com/Matoking/protontricks)
- [Arch Protontricks package](https://archlinux.org/packages/extra/any/protontricks/)
- [Community Linux setup notes](https://gist.github.com/Kjir/dadb0a2bc1a71aa265cfdbecaf7569b8)
- [Community installer](https://github.com/aoe2ct/cade-linux-installer)

The archive's `resources/app/package.json` also confirms version `1.26.0`
and CaptureAge's proprietary copyright notice. Bundled third-party license
notices are preserved in `/opt/captureage`; upstream terms are installed
under `/usr/share/licenses/captureage-bin/LICENSE`.
