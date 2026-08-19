# ompweb

Unofficial Arch Linux AUR package for
[ompweb](https://github.com/kahme247/ompweb), a local web UI for the
[oh-my-pi](https://github.com/can1357/oh-my-pi) coding agent.

This repository contains packaging and release-automation metadata only. It
builds a checksum-addressed Linux x86_64 runtime bundle from the matching npm
release and upstream `package-lock.json`, then publishes a `PKGBUILD` that
installs the verified bundle without accessing the network during `package()`.

## Installation

Install from the AUR with an AUR helper:

```bash
paru -S ompweb
```

Or build the package manually:

```bash
git clone https://aur.archlinux.org/ompweb.git
cd ompweb
makepkg -si
```

The package depends on Node.js 22.19.0 or newer and installs the AUR
`oh-my-pi` package, which provides the `omp` command.

## Usage

Start ompweb with:

```bash
ompweb
```

Then open [http://127.0.0.1:30177](http://127.0.0.1:30177). ompweb binds to the
loopback interface and opens a browser by default.

Common options and environment variables:

```bash
ompweb --port 8080
ompweb --hostname 0.0.0.0
ompweb --no-open

OMP_WEB_PASSWORD='a-long-random-password' ompweb
OMP_WEB_OMP_BIN=/usr/bin/omp ompweb
```

Binding to a non-loopback address requires `OMP_WEB_PASSWORD`. HTTP Basic Auth
does not encrypt traffic, so remote access should also use HTTPS through a
trusted reverse proxy or VPN. See the
[upstream documentation](https://github.com/kahme247/ompweb#quick-start) for
all options and security guidance.

## systemd service

The package includes the `ompweb@.service` system service template. Enable one
instance for the user that owns the omp sessions:

```bash
sudo systemctl enable --now "ompweb@${USER}.service"
```

The instance starts automatically during system boot, runs as the selected
user, uses that user's home directory, and listens on
`http://127.0.0.1:30177`. A graphical login is not required.

Pacman prints the enablement command after a fresh installation and after an
upgrade or reinstall. It does not enable the service automatically.

Check its status or follow its logs with:

```bash
systemctl status "ompweb@${USER}.service"
journalctl -u "ompweb@${USER}.service" -f
```

Disable the instance with:

```bash
sudo systemctl disable --now "ompweb@${USER}.service"
```

Only one instance can use the default port. Use a systemd override with a
different `ExecStart` port before enabling additional user instances.

## Package contents

- The application and locked runtime dependencies are installed under
  `/usr/lib/node_modules/@kahme247/ompweb`.
- `/usr/bin/ompweb` points to the upstream CLI entry point.
- The upstream MIT license is installed under `/usr/share/licenses/ompweb/`.
- `package-lock.json` is retained in the installed application for dependency
  provenance.
- `/usr/lib/systemd/system/ompweb@.service` provides an optional background
  service that runs as the selected user.

## Reproducible runtime bundle

The upstream npm archive contains the built Next.js application but excludes
`package-lock.json` and runtime dependencies. Installing it directly during
`package()` would resolve floating dependency ranges and make package output
depend on the current npm registry state.

The workflow instead:

1. reads the latest stable upstream GitHub release and matching npm version;
2. verifies the npm archive against its published SHA-512 integrity value;
3. downloads `package-lock.json` from the same Git tag;
4. installs production dependencies with `npm ci --omit=dev --ignore-scripts`;
5. creates the bundle twice with normalized metadata and requires byte-for-byte
   identical output;
6. publishes it under an immutable GitHub Release tag containing its SHA-256;
7. records that SHA-256 and immutable URL in `PKGBUILD` and `.SRCINFO`.

`PKGBUILD` only copies this bundle into the package. The workflow validates the
source and runs `makepkg` in an Arch Linux container with networking disabled,
then starts the packaged application in a separate Arch container and checks
that its HTTP page becomes ready.

## Update automation

`.github/workflows/aur-publish.yml` checks for a new upstream release every six
hours. It also supports manual runs and an `upstream-release`
`repository_dispatch` event.

A new upstream version resets `pkgrel` to `1`. If locked bundle content changes
without an upstream version change, the workflow increments `pkgrel` and
publishes a new checksum-addressed bundle without replacing the previous one.

After validation, the workflow commits recipe changes to GitHub and publishes
the package to AUR over SSH. It supports both existing AUR repositories and the
first push to an empty package repository. Publishing requires an
`AUR_SSH_PRIVATE_KEY` GitHub Actions secret whose public key is registered with
the maintainer's AUR account.

## Credits

- [kahme247/ompweb](https://github.com/kahme247/ompweb) — upstream application
  and npm release provider.
- [can1357/oh-my-pi](https://github.com/can1357/oh-my-pi) — coding agent driven
  by ompweb.

Application code and release artifacts belong to their respective upstream
projects and contributors. This AUR package is maintained independently and is
not endorsed by the ompweb or oh-my-pi authors.

## License

ompweb is distributed under the
[MIT License](https://github.com/kahme247/ompweb/blob/main/LICENSE). The package
installs the license included in the matching upstream npm release.
