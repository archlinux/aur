# otk-git

AUR package for [OTK](https://github.com/alexindigo/otk) — a browser UI
for coding-agent backends, built from git master.

## Contents

- `PKGBUILD` — Arch Linux package build script.
- `.SRCINFO` — AUR package metadata (auto-generated from PKGBUILD).
- `otk.sh` — offline launcher using Arch's `/usr/bin/deno`.
- `otk.service` — systemd user service.

## Dependencies

- **Runtime**: `deno`.
- **Build**: `git`, plus the standard Arch `base-devel` group.
- **Optional**: `opencode`, the backend server OTK connects to.

Dependencies are downloaded during the build, and the browser bundle is built
then. Runtime dependencies ship with the package. The launcher uses
`--cached-only`; starting OTK does not download dependencies or run a web build.

## Building

```sh
makepkg -si
```

Or install from the AUR with `yay -S otk-git`.

## First run

Run OTK as your normal desktop user, alongside your already-running opencode
server. OTK does not start opencode. The alpha has been tested with opencode
1.18.34, 1.18.35 and 1.19.3. See the upstream README for alpha limitations.

Create a private configuration file:

```sh
install -dm700 "${XDG_CONFIG_HOME:-$HOME/.config}/otk"
touch "${XDG_CONFIG_HOME:-$HOME/.config}/otk/otk.toml"
chmod 600 "${XDG_CONFIG_HOME:-$HOME/.config}/otk/otk.toml"
${EDITOR:-vi} "${XDG_CONFIG_HOME:-$HOME/.config}/otk/otk.toml"
```

Use the actual URL and credentials of your running server:

```toml
[server]
host = "127.0.0.1"
port = 1502

[harness]
url = "http://127.0.0.1:4097"
username = "opencode"
password = "" # Set to your opencode server's Basic auth password, if enabled.
```

If opencode uses a non-default database location, set `harness.db` to that
existing database. The default is `$XDG_DATA_HOME/opencode/opencode.db`, or
`~/.local/share/opencode/opencode.db`. OTK opens it read-only.

Start the user service, then open <http://127.0.0.1:1502/>:

```sh
systemctl --user daemon-reload
systemctl --user enable --now otk.service
```

Select **Password**, enter a username and password, choose **Configure
sidecar**, then log in. The Sessions view lists your opencode sessions.
Keep the alpha bound to localhost; see upstream's alpha security findings.

For a foreground run, stop the service first and run `otk`.

The launcher reads `${XDG_CONFIG_HOME:-$HOME/.config}/otk/otk.toml` when present.
`OTK_CONFIG` explicitly selects another file; OTK's `OTK_*` settings retain
their normal precedence. To override the service's environment, use
`systemctl --user edit otk.service` and add `[Service]` / `Environment=...`.

OTK writes its database and private `auth.toml` under
`$XDG_STATE_HOME/otk/1502` or `~/.local/state/otk/1502`; the last component
follows `server.port`. `state.path` / `OTK_STATE_PATH` overrides this.
Application files and dependencies under `/usr/lib/otk` remain read-only.

After an upgrade, run `systemctl --user restart otk.service`.
Before uninstalling, run `systemctl --user disable --now otk.service`.
Uninstalling preserves your user configuration and state.

## Maintenance

### Update .SRCINFO after PKGBUILD changes

A pre-commit hook is provided (`pre-commit.sh`) that regenerates
`.SRCINFO` and runs `namcap PKGBUILD` whenever `PKGBUILD` is staged.

On a fresh clone, install it:

```sh
cp pre-commit.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

### Bump pkgrel

Bump `pkgrel` when packaging logic changes without a new upstream version.
Regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`.

### Push to AUR

After review and explicit authorization to publish:

```sh
git add PKGBUILD .SRCINFO README.md otk.sh otk.service .gitignore LICENSE REUSE.toml pre-commit.sh
git commit -m "Update packaging"
git push
```

Packaging files are 0BSD; OTK itself is LGPL-3.0-only.
