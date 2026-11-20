# stoat-server (Arch Linux / AUR)

AUR sources for eight Stoat Rust daemons, each managed by its own systemd unit.
This archive **does not build the binaries**; run `makepkg -si` on Arch Linux.

## Upgrade notes (from 0.16.2)

- Upstream pinned at Stoat `v0.16.5` (commit `7eaa89a1a38b26e359cec3c77818ac6de36e2647`).
- MongoDB, Valkey, RabbitMQ, MinIO and LiveKit server packages are now **optional local implementations**, not mandatory colocated packages. The actual services are still required where applicable.
- systemd units no longer pull local infrastructure servers into the boot transaction automatically.
- The packaged `/etc/stoat/Revolt.toml` now uses intentionally **invalid** example hosts and credentials, never the upstream development SMTP/LiveKit/S3 secrets.
- `backup=('etc/stoat/Revolt.toml')` is retained. Customized configuration is preserved by pacman; inspect `.pacnew` files after upgrades.
- Permissions of `/etc/stoat` and `Revolt.toml` are protected with tmpfiles.d (root:stoat, directory 0750, config 0640).
- The original eight daemons and their unit names remain unchanged.

## First install

1. Install with `makepkg -si` and ensure the desired databases, message broker and object store are reachable.
2. Edit `/etc/stoat/Revolt.toml`, replacing *all* `example.invalid` and `CHANGE_ME` values with private credentials and your public URLs. Do not expose the service before doing so.
3. If using local services, configure the database, queue and storage credentials, and create the S3 bucket.
4. Ensure the configuration remains readable only by the service account:

   `sudo systemd-tmpfiles --create /usr/lib/tmpfiles.d/stoat.conf`

5. Enable the relevant Stoat daemons using `systemctl enable --now` (e.g. `stoat-api.service`, `stoat-events.service`, `stoat-file-server.service`, `stoat-proxy.service`, `stoat-crond.service`, `stoat-pushd.service`). Enable `stoat-gifbox.service` or `stoat-voice-ingress.service` only when those features are configured.
6. Check status with `systemctl --failed` and `journalctl -u stoat-api.service -b`.

## External vs. local dependencies

- The Stoat daemons need network connectivity to their configured MongoDB, Redis-compatible server, RabbitMQ and S3 object store. Those servers can run on another machine.
- `livekit` is needed only when voice calls are configured; ClamAV is optional for scanning uploaded files.
- No local infrastructure units are started implicitly by the packaged Stoat units.

If you want automatic startup ordering with *local* dependency units, create a systemd drop-in, e.g. `/etc/systemd/system/stoat-api.service.d/local-services.conf`:

```ini
[Unit]
Wants=mongodb.service valkey.service rabbitmq.service
After=mongodb.service valkey.service rabbitmq.service
```

Use service names actually installed on your host, run `systemctl daemon-reload`, and avoid such a drop-in when accessing remote servers.

## API readiness

The API unit uses `/usr/lib/stoat/wait-api`, defaulting to `http://127.0.0.1:14702/` and expecting HTTP 200. Other units wait for that endpoint. Configure `STOAT_API_READY_URL` and (optionally) `STOAT_API_WAIT_SECONDS` through systemd drop-ins if needed.

## Updating the AUR sources

The Git source uses a fixed commit, not a movable tag. When bumping upstream:

1. Verify the release is stable and inspect its notes.
2. Resolve and review the release tag's underlying **commit**, update `_commit` and `pkgver` in PKGBUILD.
3. Build/test on Arch, verify both `sha256sums` and `.SRCINFO` match, then publish.
4. Regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO` before uploading.

These source files have not been tested with a full Rust build in this environment.
