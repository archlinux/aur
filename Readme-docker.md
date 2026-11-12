# Docker setup

[Back to the main README](Readme.md)

## Requirements

- Arch Linux with a working systemd user session.
- A running Docker engine accessible to your user.
- Docker Compose, supplied by the `docker-compose` package on Arch Linux.

Check access before starting:

```bash
docker ps
docker compose version
```

Access to a Docker daemon grants broad control over its host. Do not make its socket world-writable.
With a remote daemon, bind-mount paths must exist on that daemon's host.

## Installation

Run these commands from the repository directory as a regular user:

```bash
makepkg -s
makepkg --packagelist
```

Install only the `sabnzbd-docker` archive from the printed list:

```bash
sudo pacman -U /path/to/sabnzbd-docker-VERSION-RELEASE-any.pkg.tar.zst
```

Replace the example archive path with the actual path.
Do not use `makepkg -si`: this split build contains conflicting Docker and Podman packages.

## Configuration

Create `~/.docker-sabnzbd.env`. Replace `/home/alice` with your actual home directory:

```ini
TZ=Europe/Madrid
COMPOSE_PROFILES=all

SABNZBD_PATH_PREFIX=/home/alice/usenet/sabnzbd
NZBHYDRA2_PATH_PREFIX=/home/alice/usenet/nzbhydra2
SONARR_PATH_PREFIX=/home/alice/usenet/sonarr

SABNZBD_PORT=8080
NZBHYDRA2_PORT=5076
SONARR_PORT=8989
```

To exclude Sonarr, set `COMPOSE_PROFILES=sabnzbd,nzbhydra2`.
The user configuration file must exist, even when you use packaged defaults.

Create directories for the selected applications. These commands match the example configuration:

```bash
mkdir -p "$HOME/usenet/sabnzbd"/{config,incomplete-downloads,downloads}
mkdir -p "$HOME/usenet/nzbhydra2/config"
mkdir -p "$HOME/usenet/sonarr"/{config,tv,downloads}
```

The service passes your user and group IDs as `PUID` and `PGID`.
Ensure the applications can write to their bind mounts. Rootless engines can require additional ownership configuration.

### Defaults and overrides

Systemd loads `/opt/docker-sabnzbd/default.env`, then `~/.docker-sabnzbd.env`.
Your values override the packaged defaults.

Docker Compose reads `/opt/docker-sabnzbd/.env` to calculate paths from the effective prefixes.
The package installs this file from `docker.env`.
Exported service variables take precedence over Compose `.env` values.
All Compose commands use the explicit project name `sabnzbd-docker`, regardless of the Compose file's location.

You can override an individual path in your user configuration.
For example, let Sonarr access SABnzbd's completed downloads:

```ini
SONARR_PATH_DOWNLOADS=/home/alice/usenet/sabnzbd/downloads
```

Configure both applications to use `/downloads` inside their containers.
The Sonarr example above removes the need for a separate Sonarr downloads directory.

## Start and inspect

```bash
systemctl --user daemon-reload
systemctl --user enable --now sabnzbd-docker.service
systemctl --user status sabnzbd-docker.service
journalctl --user -u sabnzbd-docker.service -n 50
```

Open the application addresses listed in the [main README](Readme.md#applications).
After editing your configuration, restart the service:

```bash
systemctl --user restart sabnzbd-docker.service
```

## Updates

Enable scheduled image pulls:

```bash
systemctl --user enable --now sabnzbd-docker-update.timer
```

The timer runs after 15 minutes of system uptime, then daily.
After a successful pull, it queues a restart if the launch service is active.
This recreates containers and briefly interrupts selected applications, even when images do not change.
An inactive launch service remains inactive.

Run an update manually:

```bash
systemctl --user start sabnzbd-docker-update.service
journalctl --user -u sabnzbd-docker-update.service -n 50
```

The update command queues the restart without waiting for its completion. Check the launch service afterward.

## Stop and unattended operation

```bash
systemctl --user disable --now sabnzbd-docker-update.timer
systemctl --user disable --now sabnzbd-docker.service
```

To keep enabled user services running without an interactive login, enable lingering on the host:

```bash
loginctl enable-linger "$USER"
```

For a rootless Docker daemon, ensure its user service also starts without an interactive login.

### Upgrade from an inferred project name

Stop the old launch service before installing the new units.
Older units normally infer the project name `docker-sabnzbd` from the installation directory.
The explicit name `sabnzbd-docker` can cause conflicts with containers belonging to an older project.
Inspect remaining containers with `docker ps -a` before proceeding.
Verify persistent data mounts and backups before removing any old containers.
