# Podman setup

[Back to the main README](Readme.md)

## Requirements

- Arch Linux with a working systemd user session.
- Working rootless Podman for the user who runs these services.
- `podman-compose` and `gettext`, which supplies `envsubst`. The package declares both dependencies.

Check Podman before starting:

```bash
podman ps
```

Local Podman does not require an API socket for these commands.
With a remote client, bind-mount paths must exist on the Podman server, not just inside the client sandbox.

## Installation

Run these commands from the repository directory as a regular user:

```bash
makepkg -s
makepkg --packagelist
```

Install only the `sabnzbd-podman` archive from the printed list:

```bash
sudo pacman -U /path/to/sabnzbd-podman-VERSION-RELEASE-any.pkg.tar.zst
```

Replace the example archive path with the actual path.
Do not use `makepkg -si`: this split build contains conflicting Docker and Podman packages.

## Configuration

Create `~/.podman-sabnzbd.env`. Replace `/home/alice` with your actual home directory:

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

Ensure the applications can write to their bind mounts under your rootless user mapping.
Do not make directories world-writable to bypass ownership problems.

### Configuration processing

The renderer loads these files in order:

1. `/opt/podman-sabnzbd/default.env`: default prefixes, ports, timezone, and profiles.
2. `~/.podman-sabnzbd.env`: user overrides.
3. `/opt/podman-sabnzbd/.env`: derived paths, installed from `docker.env`.

The renderer exports the values and substitutes them into the Compose file automatically.
Users do not need to preprocess configuration files.

**Current limitation:** `.env` assigns derived paths unconditionally, so it overwrites explicit full-path overrides.
Prefix overrides work. Full-path overrides require the pending default-value assignment fix in `docker.env`.
Sonarr imports require access to SABnzbd's completed downloads; their default download directories are separate.

Systemd creates separate private runtime directories with mode `0700`:

- Launch configuration: `%t/sabnzbd-podman/compose.yaml`.
- Update configuration: `%t/sabnzbd-podman-update/compose.yaml`.

For user services, `%t` normally means `/run/user/UID`.
Systemd removes each directory when its service stops, after stop commands finish.

## Start and inspect

```bash
systemctl --user daemon-reload
systemctl --user enable --now sabnzbd-podman.service
systemctl --user status sabnzbd-podman.service
journalctl --user -u sabnzbd-podman.service -n 50
```

Open the application addresses listed in the [main README](Readme.md#applications).
After editing your configuration, restart the service:

```bash
systemctl --user restart sabnzbd-podman.service
```

## Updates

Enable scheduled image pulls:

```bash
systemctl --user enable --now sabnzbd-podman-update.timer
```

The timer runs after 15 minutes of system uptime, then daily.
After a successful pull, it queues a restart if the launch service is active.
This recreates containers and briefly interrupts selected applications, even when images do not change.
An inactive launch service remains inactive.

Run an update manually:

```bash
systemctl --user start sabnzbd-podman-update.service
journalctl --user -u sabnzbd-podman-update.service -n 50
```

The update command queues the restart without waiting for its completion. Check the launch service afterward.

## Stop and unattended operation

```bash
systemctl --user disable --now sabnzbd-podman-update.timer
systemctl --user disable --now sabnzbd-podman.service
```

To keep enabled user services running without an interactive login, enable lingering on the host:

```bash
loginctl enable-linger "$USER"
```

### Upgrade from generated files under `/tmp`

Stop the old launch service before installing the new units.
Moving the Compose file changes its inferred project name and can cause conflicts with existing containers.
Inspect remaining containers with `podman ps -a` before proceeding.
Verify persistent data mounts and backups before removing any old containers.
