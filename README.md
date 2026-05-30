# astrbot-git

Arch Linux AUR package for [AstrBot](https://github.com/AstrBotDevs/AstrBot).

This package installs the upstream `dev` branch under `/opt/astrbot` and provides
`astrbotctl` plus a systemd template unit for multi-instance deployments.

## Install

```bash
paru -S astrbot-git
```

## Quick Start

```bash
sudo astrbotctl init bot1
sudo systemctl enable --now astrbot@bot1
astrbotctl status bot1
```

The instance config is written to `/etc/astrbot/bot1.conf`. Runtime data and the
instance virtualenv live under `/var/lib/astrbot/bot1`.

## Common Commands

```bash
astrbotctl ls
sudo astrbotctl start bot1
sudo astrbotctl stop bot1
sudo astrbotctl restart bot1
astrbotctl paths bot1
```

Run AstrBot commands inside an instance:

```bash
astrbotctl cli bot1 plug list
astrbotctl cli bot1 plug install <plugin_repo>
```

Manage dashboard credentials:

```bash
sudo astrbotctl admin -u admin -p 'new-password' bot1
```

Back up and restore:

```bash
astrbotctl export bot1
astrbotctl import bot1 /path/to/backup.zip
```

Refresh an instance virtualenv after a package upgrade:

```bash
sudo astrbotctl sync bot1
sudo astrbotctl sync --all
```

## HTTPS

`certbot` is optional. Install it before using the helper:

```bash
sudo pacman -S certbot
sudo astrbotctl certbot bot1
```

## Paths

| Path | Purpose |
| --- | --- |
| `/opt/astrbot` | Packaged upstream source |
| `/usr/bin/astrbotctl` | Management command |
| `/usr/lib/systemd/system/astrbot@.service` | Instance service template |
| `/etc/astrbot/<name>.conf` | Instance config |
| `/var/lib/astrbot/<name>` | Instance data and virtualenv |
| `/var/cache/astrbot` | Shared package/runtime cache |

## Troubleshooting

Follow logs:

```bash
journalctl -u astrbot@bot1 -f
```

Remove a stale runtime lock:

```bash
sudo rm -f /var/lib/astrbot/bot1/astrbot.lock
```

Force a virtualenv rebuild:

```bash
sudo rm -rf /var/lib/astrbot/bot1/.venv
sudo systemctl restart astrbot@bot1
```

## Packaging

Local package maintenance helper:

```bash
./update.sh
```

Before publishing, regenerate `.SRCINFO`:

```bash
makepkg --printsrcinfo > .SRCINFO
```
