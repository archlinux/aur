# OTK AUR packages

AUR packages for [Open Terminal Kit](https://github.com/alexindigo/otk), a
browser UI for coding-agent backends. Each package installs the same compiled
executable, user service, README, example configuration and upstream license.
Choose one channel; the packages conflict and replace one another.

## Contents

- `PKGBUILD` — Arch Linux package build script.
- `.SRCINFO` — AUR metadata generated with makepkg in the OTK test VM.
- `pre-commit.sh` — canonical metadata/lint hook.
- `LICENSE`, `REUSE.toml` — 0BSD packaging-file license annotations. The installed
  application is LGPL-3.0-only; its license comes from the upstream source/asset.

## Dependencies

| Package | Runtime | Build |
|---|---|---|
| `otk-bin` | glibc, libgcc | Standard base-devel; downloads release assets |
| `otk` | glibc, libgcc | deno, standard base-devel |
| `otk-git` | glibc, libgcc | deno, git, standard base-devel |

Opencode is optional as an Arch package: OTK connects to a separately running
server. Deno is never needed at runtime. Both x86_64 and aarch64 are declared;
the beta packaging verification executed only x86_64.

## Building

For a human installing from this AUR checkout:

```sh
makepkg -si
```

The source variants use the upstream `deno task compile
"${CARCH}-unknown-linux-gnu" <output>` recipe. Network access is required during
the build for frozen Deno dependencies. The binary variant downloads the
architecture-specific GitHub release archive and verifies its SHA-256 against
the value in the release's `SHA256SUMS`. Both strip and debug splitting are
disabled: stripping a Deno executable destroys its embedded application.

## Version scheme

Tags map `v0.1.0-alpha.1` to `0.1.0alpha1`, `v0.1.0-beta.1` to `0.1.0beta1`,
and `v0.1.0-rc.1` to `0.1.0rc1`; the final release is `0.1.0`.
Pacman's vercmp orders these alpha < beta < rc < final. The VCS package appends
`.r<distance>.g<hash>` and uses a commit-date/hash fallback if no tag is available.

All three use `epoch=1`, permanently retained for future versions. This makes
the corrected prerelease versions newer than the previously published dotted
alpha (`0.1.0.alpha.1.r0.g2201d86`), which pacman otherwise ranks above
`0.1.0beta1`. `otk-git` has `pkgrel=2` because its packaging changed; upstream
commits alone do not require a pkgrel bump. Release packages start at pkgrel 1.

## Laptop upgrade from the alpha otk-git

These are human installation instructions, not agent host-test authorization.
Keep the existing private config and state; do not repeat password setup.
Use the same desktop user as the running opencode server.

```sh
yay -S otk-bin
# Accept removal of the conflicting otk-git package.
systemctl --user daemon-reload
systemctl --user restart otk.service
```

Open <http://127.0.0.1:1502/> (or the port in your existing config) and log in
with the existing credentials. To choose a different channel, use `yay -S otk`
or `yay -S otk-git`, accept the conflicting package's removal, then run the same
daemon-reload/restart commands. The old `/usr/lib/otk` tree and launcher are
removed by pacman; no manual deletion is needed. Keep the installed Deno package
if anything else uses it; source package builds still require it.

The config remains `${XDG_CONFIG_HOME:-$HOME/.config}/otk/otk.toml`; explicit
`OTK_CONFIG` wins. State stays at `${XDG_STATE_HOME:-$HOME/.local/state}/otk/<port>`
unless already overridden. The service must keep using the same port/state path
to retain the password and other state.

## Fresh laptop installation

```sh
yay -S otk-bin
install -dm700 "${XDG_CONFIG_HOME:-$HOME/.config}/otk"
touch "${XDG_CONFIG_HOME:-$HOME/.config}/otk/otk.toml"
chmod 600 "${XDG_CONFIG_HOME:-$HOME/.config}/otk/otk.toml"
${EDITOR:-vi} "${XDG_CONFIG_HOME:-$HOME/.config}/otk/otk.toml"
```

Set the running opencode server URL and its real Basic auth credentials:

```toml
[server]
host = "127.0.0.1"
port = 1502

[harness]
url = "http://127.0.0.1:4097"
username = "opencode"
password = "" # Set if the running backend requires a password.
```

For a non-default opencode database, set `harness.db` to its absolute path.
Keep OTK on localhost. Then:

```sh
systemctl --user daemon-reload
systemctl --user enable --now otk.service
```

Open <http://127.0.0.1:1502/>, select Password, enter the initial credentials,
choose Configure sidecar, then log in. Configuration and state are user-owned
and are not removed with the package. Before uninstalling:

```sh
systemctl --user disable --now otk.service
sudo pacman -R otk-bin # Substitute the installed package name.
```

## Maintenance

On a fresh AUR clone, install the canonical pre-commit hook:

```sh
install -m755 pre-commit.sh .git/hooks/pre-commit
```

It regenerates `.SRCINFO` and runs `namcap PKGBUILD` when PKGBUILD is staged.
Agent builds/checks run in the named OTK VM, never on the laptop. Regenerate
metadata there with `makepkg --printsrcinfo > .SRCINFO`, then run `makepkg -s`,
`namcap PKGBUILD` and `namcap <package-file>`. For a new upstream release, update
the release version/checksums and reset release pkgrel to 1. For packaging-only
changes, increment pkgrel. Retain epoch 1 in every channel.

After verification, the authorized maintainer commits signed changes in the AUR
repository. Push to its `master` branch only after explicit publication approval;
the OTK release orchestrator owns those commits and pushes for this staging task.
