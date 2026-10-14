# grappa-bin

Official prebuilt Grappa releases for Arch Linux x86_64, repackaged from
[vjt/grappa-irc](https://github.com/vjt/grappa-irc/releases).

Grappa is an always-on IRC bouncer/server with a REST and Phoenix Channels
WebSocket API. It includes cicchetto, an installable browser client. The
Erlang runtime is bundled; Elixir, Erlang and Bun are not build dependencies.
For a terminal client connected to an existing server, install `shottino-bin`.

## Install and configure

Install with `yay -S grappa-bin`, or clone this AUR repository and run
`makepkg -si` after reviewing `PKGBUILD` and `grappa.install`.

The package creates the `grappa` system user, state directories and a protected
configuration file, generating missing secrets without replacing existing ones.
It does not enable/start the service or run database migrations automatically.

1. Edit `/etc/grappa/grappa.env` as root. Set `PHX_HOST` to the public hostname
   (without `https://`) and set `VAPID_SUBJECT` to your contact address.
2. Initialize the database and built-in themes:
   ```sh
   sudo grappa migrate
   sudo grappa seed-themes
   ```
3. Start the server and enable it at boot:
   ```sh
   sudo systemctl enable --now grappa.service
   ```
4. Create the first administrator (the command prompts for a password):
   ```sh
   sudo grappa create-user YOUR_NAME --admin
   ```

The default HTTP port is 4000. Check `curl http://127.0.0.1:4000/healthz`
and `journalctl -u grappa.service`. Use an HTTPS reverse proxy for a public
deployment; preserve the security headers emitted by Grappa.

Configuration/secrets: `/etc/grappa/grappa.env`.
Database/uploads: `/var/lib/grappa`.
Back up both together and keep the encryption key safe: losing it prevents
recovery of stored IRC credentials. Neither directory is deleted on removal.

## Upgrade

Read the [release notes](https://github.com/vjt/grappa-irc/releases), stop the
service and make a consistent backup of the database, uploads and configuration.
After upgrading the package, run:

```sh
sudo systemctl stop grappa.service
sudo grappa gen-secrets
sudo grappa migrate
sudo grappa seed-themes
sudo systemctl start grappa.service
```

Stop on any failed migration and investigate before starting the service.
The package never restarts a running server or migrates a live database.
Before uninstalling, run `sudo systemctl disable --now grappa.service`.

## Packaging

This is a community-maintained binary package, not an upstream-maintained AUR
submission. It conflicts with and provides `grappa`. Downloads use an explicit
GitHub release tag and SHA-256 checksum. Only upstream's `usr/` payload is
included; its package metadata and automatic service/database hooks are excluded.
Arch-specific installation instructions are in this file; the bundled upstream
packaging documentation also describes other distribution formats.

Known upstream issue in release 1.5.14: the bundled Erlang release and
`grappa version` report `0.0.0`, although the official package metadata and
GitHub release identify 1.5.14. This package preserves that upstream payload;
use `pacman -Q grappa-bin` to check the installed distribution version.

Report packaging problems on this AUR page; report application bugs at
[upstream issues](https://github.com/vjt/grappa-irc/issues).
