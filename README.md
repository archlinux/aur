# Hypergryph Launcher (DWProton)

Unofficial Arch Linux integration for the official Windows Hypergryph Launcher.
The package contains only the open-source integration command, desktop entry,
and license. It does not distribute Hypergryph binaries, a Wine prefix, game
assets, account data, or its own copy of DWProton.

## Installation

This project has not been published to the AUR. Install its AUR dependency before
building the local package:

```sh
paru -S dwproton-bin
makepkg --syncdeps --install
```

Start **Hypergryph Launcher (DWProton)** from the application menu, or run:

```sh
hypergryph-launcher-dwproton
```

If the official launcher is absent, the command downloads its original installer
from Hypergryph over HTTPS, verifies its pinned SHA-256 digest, and opens the
normal installation interface. Read and accept the vendor's agreement yourself;
this integration does not silently accept it. Keep the default Windows install
location, then use **Launch Now** when installation finishes:

```text
C:\Program Files\Hypergryph Launcher
```

Game installation and updates remain the official launcher's responsibility.
Run the integration command again to open an existing launcher. It does not
reinstall the client or redownload an existing game.

## User data and runtime

The default paths intentionally match the existing Arknights installation used
to verify this integration:

| Purpose | Path |
| --- | --- |
| Proton compatdata | `$XDG_DATA_HOME/arknights-proton/compatdata` |
| Wine prefix | `$XDG_DATA_HOME/arknights-proton/compatdata/pfx` |
| Private Steam compatibility directory | `$XDG_DATA_HOME/hypergryph-launcher-dwproton/steam` |
| Verified installer cache | `$XDG_CACHE_HOME/hypergryph-launcher-dwproton` |

Unset XDG variables default to `~/.local/share` and `~/.cache`, respectively.
No prefix is created while pacman installs the package. Steam itself is not a
dependency. Never run the integration as root.

The default runtime is the executable installed by `dwproton-bin`:

```text
/usr/share/steam/compatibilitytools.d/dwproton/proton
```

An existing DWProton installation can be selected explicitly, including the
locally verified Lutris installation:

```sh
HYPERGRYPH_LAUNCHER_PROTON="$HOME/.local/share/lutris/runners/wine/dwproton-11.0-12-x86_64/proton" \
  ./hypergryph-launcher-dwproton
```

`HYPERGRYPH_LAUNCHER_COMPAT_DATA` overrides the compatdata directory. Pass the
parent of `pfx`, not `pfx` itself. Do not point different Wine versions at an
active prefix or delete the prefix to uninstall this integration: it contains
user-managed games and account data.

## Commands

```sh
hypergryph-launcher-dwproton                 # Install on first use, otherwise open the launcher
hypergryph-launcher-dwproton --install       # Open the original installer
hypergryph-launcher-dwproton --print-prefix  # Inspect the configured prefix without launching
hypergryph-launcher-dwproton --version
hypergryph-launcher-dwproton --help
```

## Verification

Verified locally on Niri/Wayland with DWProton 11.0-12:

- The command opened the official launcher and recognized the existing
  Arknights installation and its running game process.
- A separate fresh prefix downloaded the installer from the official service,
  passed SHA-256 verification, and displayed its installation/agreement screen.
- ShellCheck passed for the command; the desktop entry passed
  `desktop-file-validate`; `makepkg` built the package and validated all sources.
- The local package build used `--nodeps` because `dwproton-bin` was not installed;
  the actual UI checks used the existing DWProton 11.0-12 runtime explicitly.
  The currently published `dwproton-bin` release was not tested here.

- Automation checks passed `actionlint` and ten isolated updater regression
  tests, including an offline update using the repository's actual metadata and
  verification of the updated command's `--version` output. A real official
  download check confirmed installer version `1.6.0.1601`, its pinned SHA-256,
  and an unchanged package release.
- The local Arch build succeeded, `.SRCINFO` matched `makepkg --printsrcinfo`,
  and the command extracted from the built package reported its expected version.

The Docker build step was attempted locally but could not start because the
host's Docker/containerd could not read an image-layer blob (`operation not
permitted`); pulling the image failed for the same reason. The local Arch build
does not establish successful execution on GitHub-hosted runners. GitHub commits
and AUR publication have not been executed as part of this local implementation.

These checks do not establish successful account login, gameplay, anti-cheat
compatibility, or compatibility with every DWProton release.

## Automatic updates and AUR publishing

`.github/workflows/aur-publish.yml` follows the same pinned-action and AUR SSH
credential conventions as the other ParticleG AUR projects:

- Pushes to `main` validate, build, and publish the current package recipe.
- Pull requests validate and build without updating upstream metadata, committing
  changes, or receiving AUR credentials.
- A scheduled check runs at minute 43 every six hours (UTC). It builds and
  publishes only when the installer metadata or packaged source checksums change.
- **Run workflow** checks upstream and builds on demand. Enable `force_publish`
  to publish even when no update was detected.

The build job has read-only repository permissions. After a successful build,
the separate publishing job downloads the verified recipe, commits changes to
`PKGBUILD`, `.SRCINFO`, and the integration command on `main`, then pushes the
recipe to the AUR. It uses normal non-force pushes; branch protection or a
concurrent conflicting push must be resolved before publication can proceed.
The automated GitHub commit does not trigger a second workflow run.

The AUR receives only the recipe and integration sources. Built Arch packages
are retained as workflow artifacts, not uploaded as binaries to the AUR.
Installer bytes are streamed only to calculate their digest and are never
stored in the repository, package, workflow artifacts, or AUR repository.

### Repository setup

1. Push this project to a GitHub repository whose default branch is `main`, and
   enable GitHub Actions.
2. Add a dedicated SSH public key to the publishing account's AUR profile. That
   account must be allowed to create or maintain `hypergryph-launcher-dwproton`.
3. Store the corresponding private key as the GitHub Actions repository secret
   `AUR_SSH_PRIVATE_KEY`. Configure it through GitHub's secrets UI or CLI; never
   commit it or include it in workflow files.
4. Allow the publishing job's `GITHUB_TOKEN` to write repository contents and
   satisfy any protection rules on `main`. No personal access token is required.
5. Run the workflow with `force_publish` enabled for the first publication.

Scheduled workflows run only from the default branch and can be delayed by
GitHub. GitHub can disable schedules in inactive public repositories.
Adding these files locally does not create a GitHub repository, configure
credentials, or submit the package to the AUR.

### Installer version policy

`scripts/check-update.py` reads the stable official download URL from the
integration command, follows HTTPS redirects, and extracts the four-part version
from the official **Arknights-channel EXE** filename. The full-update ZIP used by
the launcher's internal updater is a different artifact and can have a different
build number; it does not determine this bootstrap package's version.

The checker streams and hashes the EXE even if its version is unchanged, so a
same-version upstream replacement is detected. A newer installer sets `pkgver`
to its version and resets `pkgrel` to `1`. Changed installer or packaged source
checksums at the same version increment `pkgrel`; identical inputs leave both
values unchanged. Older versions, unexpected filenames, non-HTTPS redirects,
and invalid or truncated downloads fail before updating package files.

Check without writing files:

```sh
python3 scripts/check-update.py
```

Apply an update locally, regenerate metadata, and build:

```sh
python3 scripts/check-update.py --apply
makepkg --printsrcinfo > .SRCINFO
makepkg --syncdeps --install
```

CI regenerates `.SRCINFO` and builds as an unprivileged user in
`archlinux:base-devel`. It uses `--nodeps` because `dwproton-bin` is an AUR-only
runtime dependency and is not needed to assemble the integration package.
Packaging and command-line smoke checks do not establish game or GUI
compatibility with an untested DWProton release.

## Legal and support boundaries

This project is not affiliated with or endorsed by Hypergryph or DWProton.
The integration code is licensed under 0BSD; that license does not cover
Hypergryph software, services, names, trademarks, or assets.

The [official launcher agreement](https://user.hypergryph.com/protocol/plain/launcher/service)
restricts copying, redistribution, modification, and reverse engineering without
permission. This project therefore publishes only integration code and obtains
the unmodified Windows installer directly from the vendor for the local user.
This design does not imply that Hypergryph supports Wine or third-party launcher
integration. Review the vendor's current terms and assess account/service risks
before using either the official client under Wine or a third-party integration.
The integration does not modify the client or bypass anti-cheat.
