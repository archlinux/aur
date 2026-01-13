# bitwarden-systemd

A systemd integration for [bitwarden-cli](https://github.com/bitwarden/clients/tree/main/apps/cli), handling `bw login` and `bw unlock`; with a `bw` wrapper to use the resulting session key.

## Installation

Firstly, set your GPG signature key fingerprint(s) in `$XDG_CONFIG_HOME/bw-systemd/.gpg-id` (or `$HOME/.config/bw-systemd/.gpg-id`) for [`pass`](https://www.passwordstore.org/). (This can be a symlink to a .gpg-id in another pass store dir if you wish.)

then obtain your Bitwarden [client ID & secret](https://bitwarden.com/help/cli/#using-an-api-key) (for `bw login --apikey) and password; then store them ([`systemd-creds`](https://systemd.io/CREDENTIALS/)-encrypted) when prompted with:
```
bw-systemd-set-creds [--no-overwrite]
```

and finally:
```
systemctl --user enable --now /path/to/bw-login.service
systemctl --user enable --now /path/to/bw-session.service
```

On Arch, you can use the included `PKGBUILD` to `makepkg -si`, or install from the [AUR](https://aur.archlinux.org/packages/bitwarden-systemd).

## Usage

- `bw-systemd-set-creds` is used to set credentials on first use, or API key/master password rotation;
- `bw-login.service` will provide `bw login` on user login, and `bw logout` on exit;
- `bw-session.service` manages a session key provided by `bw unlock`, until it `bw lock`s the vault again on exit;
- `bw-systemd` is a wrapper around `bw` (the Bitwarden CLI) that uses the `--session` provided by `bw-session.service`.

## Tips

You may like to `ln -s $(which bw-systemd) /usr/local/bin/bw`, in order that you can use `bw` as normal but pick up the managed session.
