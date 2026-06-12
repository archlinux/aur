# tegola-headless

AUR package sources for **Tegola headless** on Arch Linux.

Tegola is a vector tile server for Mapbox Vector Tiles. This package builds the Tegola server binary from source, but does not include the built-in Tegola web viewer.

## Package scope

This package provides:

- `/usr/bin/tegola`
- `tegola.service`
- `/etc/tegola/tegola.toml`
- system user and group `tegola`
- runtime directories:
  - `/var/lib/tegola`
  - `/var/cache/tegola`

The package is intended for server deployments where Tegola is used as a backend vector tile service, typically behind a reverse proxy such as Nginx.

## Headless variant

The upstream Tegola source tree contains an optional web viewer.

This package intentionally builds Tegola without the embedded viewer:

```text
ui viewer: viewer not built
```

The vector tile server itself is fully usable. In particular, the PostGIS provider is included:

```text
!noPostgisProvider
```

A separate non-headless `tegola` package may be created later to include the built-in viewer.

## Build

Build the package with:

```bash
makepkg -si
```

Regenerate `.SRCINFO` after changes to `PKGBUILD`:

```bash
makepkg --printsrcinfo > .SRCINFO
```

Update checksums after changing source files:

```bash
updpkgsums
makepkg --printsrcinfo > .SRCINFO
```

## Installation test

After installation, verify the installed files:

```bash
pacman -Ql tegola-headless
```

Check the binary:

```bash
sudo -u tegola /usr/bin/tegola version
```

Expected output includes:

```text
version: v0.21.0
!noPostgisProvider
ui viewer: viewer not built
```

## Service

The package installs a systemd service:

```bash
systemctl cat tegola.service
```

Start the service manually:

```bash
sudo systemctl start tegola.service
systemctl status tegola.service --no-pager
```

Check the local HTTP endpoint:

```bash
curl -I http://127.0.0.1:8080/
```

Stop the service again:

```bash
sudo systemctl stop tegola.service
```

Enable the service permanently only after configuring `/etc/tegola/tegola.toml`:

```bash
sudo systemctl enable --now tegola.service
```

## Configuration

The main configuration file is:

```text
/etc/tegola/tegola.toml
```

It is installed with restricted permissions because it may contain database connection strings and passwords:

```text
/etc/tegola              root:tegola 0750
/etc/tegola/tegola.toml  root:tegola 0640
```

The service runs as user `tegola`.

## Repository layout

```text
PKGBUILD
.SRCINFO
tegola.service
tegola.sysusers
tegola.tmpfiles
tegola.toml.example
tegola.install
README.md
```

## Remotes

## Remotes

## Remotes

This repository is maintained in an internal Forgejo instance as the working repository.

The package is also published to the Arch User Repository.

```text
origin  internal Forgejo working repository
aur     Arch User Repository
```

Typical workflow:

```bash
git push origin main
git push aur main:master
```

The AUR remote is:

```bash
git remote add aur ssh://aur@aur.archlinux.org/tegola-headless.git
```

## AUR status

The package has been published to the Arch User Repository as:

```text
tegola-headless
```

It has been tested successfully with `yay`:

```bash
yay -S tegola-headless
```

The full test path was:

```text
Forgejo
  -> AUR
  -> yay
  -> makepkg
  -> pacman
  -> systemd
  -> Tegola HTTP endpoint
```

The service was verified with:

```bash
sudo systemctl start tegola.service
systemctl status tegola.service --no-pager
curl -I http://127.0.0.1:8080/
sudo systemctl stop tegola.service
```

Expected result:

```text
HTTP/1.1 200 OK
```
