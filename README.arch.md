# stoat-server (Arch Linux / AUR)

AUR sources for eight Stoat Rust daemons, each managed by its own systemd unit.
This archive **does not build the binaries**; run `makepkg -si` on Arch Linux.

## Upgrade notes (from 0.16.2)

- Upstream fetched from the Stoat release tag `v0.16.5` (`#tag=v${pkgver}`), rather than a commit hash.
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

The Git source uses the upstream release **tag** `v${pkgver}`. When bumping upstream:

1. Verify the release is stable and inspect its notes.
2. Change `pkgver` (and reset `pkgrel=1`), with no commit-hash lookup.
3. Regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`.
4. Build/test on Arch, verify all checksums, then publish.

**Security/reproducibility note:** Git tags can be moved by upstream; because Git VCS sources are marked `SKIP` in `sha256sums`, this is not as immutable as the earlier commit pin. The pinned `redis-rs` Git dependency and its compatibility patch are unchanged.

These source files have not been tested with a full Rust build in this environment.

## Rust 1.100 compatibility fix (pkgrel 2)

The project's pinned Git dependency `revoltchat/redis-rs` at commit
`523b2937367e17bd0073722bf6e23d06042cb4e4` relies on older Rust
never-type inference in `redis/src/script.rs`. Two `SCRIPT LOAD` queries must
explicitly specify `String` as their return type (the Redis SHA-1 response).

The `redis-rs-never-type.patch` file fixes the two call sites without changing
`Cargo.lock` or upgrading any other dependency. `prepare()` uses a private
`$srcdir/.cargo-home` to avoid changing the global Cargo cache; `build()` uses
the same cache. `cargo fetch --locked` is followed by patching the exact pinned
revision and `cargo build --frozen`.

Note: a clean build now downloads dependencies to that private Cargo cache.
This patch fixes the reported E0277 errors, but a complete compilation on Arch
Linux is still required to verify any additional upstream compatibility issues.

