# Bacularis 7.0.0 for Arch Linux — split packages

This **single AUR pkgbase** builds four packages:

| Package | Contents | Dependencies |
| --- | --- | --- |
| `bacularis-common` | shared PHP application shell, third-party/vendor libraries, assets, tmpfiles, Nginx/PHP examples | php |
| `bacularis-web` | Bacularis Web frontend, Web settings and logs | common |
| `bacularis-api` | Bacularis API, API settings and logs, role-scoped sudoers generator + pacman hook | common, sudo |
| `bacularis` | *empty metapackage* for the three components above | common + web + api |

This matches the upstream Web/API separation: a single Web frontend can connect
via HTTP(S) to one or more remote API hosts; Bacula need not be installed on the
Web host. The shared `/usr/share/webapps/bacularis/htdocs` application shell is
owned by `bacularis-common` and supports either module when installed.

## Install

Install independently on the relevant Arch hosts:

```sh
# Frontend only (can run on a separate server):
sudo pacman -S bacularis-web

# Director/Storage/Client host (API only):
sudo pacman -S bacularis-api

# All three on the same machine (metapackage):
sudo pacman -S bacularis
```

These commands require a configured binary repository or an AUR helper. With
plain `makepkg` in this source tree, build **all four** and install with
`sudo pacman -U ./bacularis-{common,web,api}-7.0.0-2-any.pkg.tar.zst` (or
install the metapackage last). The `bacularis` package owns no application
files; it exists only to pull in all three components.

### Nginx

Nginx is **not** a packaged subcomponent; the optional example is installed at:

`/usr/share/doc/bacularis/nginx.conf.example`

Review it for your deployment, copy into your own server config, and configure
PHP-FPM. It listens on `127.0.0.1:9097` and is deliberately not enabled by
pacman. The shared entrypoint is used with Web and/or API enabled in the Bacularis
wizard. Protect remote interfaces with TLS and authentication. Change the
upstream default `admin/admin` password on the first login.

### Automatically generated Bacula sudoers (`bacularis-api` only)

The API package installs `/usr/bin/bacularis-sudoers-update` and a pacman hook:

- On API install/upgrade the installation script runs the generator.
- On `bacula-*` installation, removal or upgrade a PostTransaction hook reruns it.
- On API removal only its generated sudoers file is deleted.
- An existing administrator-managed `/etc/sudoers.d/bacularis` **is not overwritten**.

It uses `pacman -Qq` / `pacman -Qql` to identify installed components and owned
executables, and only allows `http` to run available role-appropriate tools as
root:

| Package | Executables | Systemd actions when unit file exists |
| --- | --- | --- |
| `bacula-console` | `bconsole`, `bbconsjson` | — |
| `bacula-dir` | `bdirjson` | start/stop/restart `bacula-dir` |
| `bacula-sd` | `bsdjson` | start/stop/restart `bacula-sd` |
| `bacula-fd` | `bfdjson` | start/stop/restart `bacula-fd` |
| `bacula-common`, `bacula-dir-postgresql` | may supply owned executables | no extra actions |

No wildcards or authorization for `systemctl enable`, `disable`, `daemon-reload`,
or unrelated services are granted. For the API Actions tab use exact commands,
for example `/usr/bin/systemctl restart bacula-sd` (no `.service` suffix).

```sh
sudo /usr/bin/bacularis-sudoers-update
sudo visudo -cf /etc/sudoers.d/bacularis
sudo -l -U http
```

> Security: allowing `bconsole` to run as root can permit far-reaching Bacula
> administration. Prefer a dedicated PHP-FPM pool user for exposed API hosts;
> this AUR packaging assumes Arch's default `http` user. Sudoers only grants
> execution, not permission to modify Bacula configuration files directly.

### File locations

- Shared application `/usr/share/webapps/bacularis/`
- API code `protected/vendor/bacularis/bacularis-api/`
- Web code `protected/vendor/bacularis/bacularis-web/`
- Common code `protected/vendor/bacularis/bacularis-common/`
- Configuration `/var/lib/bacularis/{api-config,web-config}` (only when installed)
- Logs `/var/log/bacularis/{api,web}`
- Working and cache `/var/lib/bacularis/working`, `/var/cache/bacularis`
- Compatibility symlinks `/etc/bacularis/API`, `/etc/bacularis/Web`

Systemd tmpfiles prepares writable directories at installation. Persistent files
are not owned by pacman and survive upgrades.

## AUR publication and GitLab CI

The five **upstream archive** SHA-256 placeholders are `SKIP` in this template,
which is intentionally **not yet ready for publication**. On a networked Arch
builder run:

```sh
sudo pacman -S --needed base-devel pacman-contrib
makepkg -o
updpkgsums
makepkg --verifysource
makepkg --printsrcinfo > .SRCINFO
makepkg -s --cleanbuild
```

Verify the four `.pkg.tar.zst` files and run tests before publishing. The
companion GitLab CI project recomputes the five hashes, verifies and builds all
four packages, and rejects any remaining `SKIP` before pushing to AUR. For a
package-only change on the same upstream version CI increments `pkgrel`.

Official sources:
- https://bacularis.app/doc/brief/updating.html
- https://bacularis.app/doc/brief/configuration.html
- https://bacularis.app/doc/remote/basic.html

This split packaging and the dynamic pacman hook have not been tested end-to-end
against a live Bacula server. Test API authentication, the wizard, backup and
restore after installation, before exposing it outside localhost.
