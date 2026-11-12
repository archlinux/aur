# SABnzbd container services

Run SABnzbd, NZBHydra2, and Sonarr with systemd user services and Docker or Podman.
The packages target Arch Linux.

## Choose a runtime

- [Podman setup and usage](Readme-podman.md): install `sabnzbd-podman` and configure `~/.podman-sabnzbd.env`.
- [Docker setup and usage](Readme-docker.md): install `sabnzbd-docker` and configure `~/.docker-sabnzbd.env`.

Install only one variant. Both use the same container names and default ports.
The Docker package also declares a conflict with the Podman package.

The [sabnzbd-docker AUR entry](https://aur.archlinux.org/packages/sabnzbd-docker) provides another installation option.

## Applications

The Compose file uses these LinuxServer.io images:

| Application | Image | Default address |
| --- | --- | --- |
| SABnzbd | `lscr.io/linuxserver/sabnzbd:latest` | <http://localhost:8080> |
| NZBHydra2 | `lscr.io/linuxserver/nzbhydra2:latest` | <http://localhost:5076> |
| Sonarr | `lscr.io/linuxserver/sonarr:latest` | <http://localhost:8989> |

Ports bind to all host interfaces by default. Restrict access with application settings and your firewall.

## Configuration rules

- Use persistent, absolute host paths. The packaged `/tmp` data defaults are not suitable for persistent storage.
- Create the host directories before starting containers.
- Configure application paths using container paths, such as `/downloads`, rather than host paths.
- Keep assignments in `NAME=value` form, without spaces around `=`.
- Put comments on separate lines. Systemd environment files do not support shell-style inline comments.
- Use literal absolute paths in user configuration files. Do not rely on `$HOME` or `~` expansion.
- Use `COMPOSE_PROFILES=all` for all applications, or select profiles such as `sabnzbd,nzbhydra2`.

Run service-management commands on the host, not inside a restricted development sandbox.
