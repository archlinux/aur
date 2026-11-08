# Bacularis for Arch Linux (AUR)

This PKGBUILD produces **one** `bacularis` package containing the Web and API
application. No Nginx virtual host is automatically enabled. The example Nginx
config is installed only at `/usr/share/doc/bacularis/nginx.conf.example`.

Upstream source archives follow [the official manual update layout](https://bacularis.app/doc/brief/updating.html):
`bacularis-app`, `bacularis-api`, `bacularis-web`, `bacularis-common`, and
`bacularis-external`.

## Before submitting to AUR

The five upstream release hashes are `SKIP` in this **template only**. This is
not ready for an AUR push. On Arch Linux, run:

```bash
sudo pacman -S --needed base-devel pacman-contrib
makepkg -o
updpkgsums
makepkg --verifysource
makepkg --printsrcinfo > .SRCINFO
makepkg -s --cleanbuild
```

Check that neither PKGBUILD nor .SRCINFO has a `SKIP` hash before publication.
The GitLab CI updater performs these steps automatically and requires a complete
package build for publishing. The locally pinned five auxiliary file hashes
are already computed.

## Installation and web server

```bash
sudo pacman -U bacularis-7.0.0-1-any.pkg.tar.zst
sudo pacman -S --needed php-fpm nginx
# The default Nginx config may need `include /etc/nginx/conf.d/*.conf;`
sudo install -Dm644 /usr/share/doc/bacularis/nginx.conf.example /etc/nginx/conf.d/bacularis.conf
sudo nginx -t
sudo systemctl enable --now php-fpm nginx
```

Check `php -m` for required PHP modules and consult
`/usr/share/doc/bacularis/bacularis-php.ini.example` if some modules are
not enabled; avoid loading the same module twice. The sample virtual host
listens only on `127.0.0.1:9097`. To serve external requests, configure a
secured HTTPS reverse proxy. Default upstream web credentials are `admin/admin`:
**replace them immediately**.

## Bacula sudoers

By default, the package installs `/etc/sudoers.d/bacularis` owned by root,
mode **0440**; pacman lists it in `backup=()`, so local changes survive updates.
The example uses Arch's web user `http` and permits these programs under root:

```text
bconsole
bdirjson
bsdjson
bfdjson
bbconsjson
```

Official documentation: [Bacularis sudo settings](https://bacularis.app/doc/brief/configuration.html#sudo-settings).
Both `/usr/bin` (typical Arch layout) and `/usr/sbin` (upstream example) are
covered, but their actual locations must match what you configure in the
Bacularis setup wizard:

```bash
for x in bconsole bdirjson bsdjson bfdjson bbconsjson; do command -v "$x"; done
sudo visudo -cf /etc/sudoers.d/bacularis
sudo -u http sudo -n -l
```

**Security:** `bconsole` can control Bacula as the Director administrator,
so this is substantial root-level access. Expose Bacularis only to trusted
users and use a dedicated PHP-FPM pool if you share a web server with other
applications. The five JSON utilities are primarily for configuration editing;
for basic monitoring, `bconsole` may suffice. You can remove unused rules.

Optional `systemctl start/stop/restart bacula-{dir,sd,fd}` permissions, also
listed in the upstream documentation, are provided only as:
`/usr/share/doc/bacularis/bacularis-actions.sudoers.example`.
To enable intentionally:

```bash
sudo install -m 440 /usr/share/doc/bacularis/bacularis-actions.sudoers.example \
  /etc/sudoers.d/bacularis-actions
sudo visudo -cf /etc/sudoers.d/bacularis-actions
```

Review the selected daemon unit names and remove unnecessary ones first.
No unrestricted `http ALL=(ALL) NOPASSWD: ALL` is used.

## Persistent data

- App `/usr/share/webapps/bacularis`
- Settings `/var/lib/bacularis/{api-config,web-config}`
- Working data `/var/lib/bacularis/working`
- Log files `/var/log/bacularis/{api,web}`
- Caches `/var/cache/bacularis/{runtime,assets}`
- Compatibility paths `/etc/bacularis/{API,Web}`

On first install these are prepared by `/usr/lib/tmpfiles.d/bacularis.conf`.
If needed, run `sudo systemd-tmpfiles --create /usr/lib/tmpfiles.d/bacularis.conf`.
The package does not replace user settings on upgrade. Verify that PHP-FPM
runs as `http` and has the intended access rights. Use the Bacularis wizard
to connect to your existing Bacula Director and PostgreSQL catalog.

This packaging has not been end-to-end tested with a running Arch Linux
Bacula installation. Verify API, login, configuration and restore operations
before enabling remote access.
