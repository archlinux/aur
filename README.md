# rclone-sync-timer

systemd template timer/service that periodically syncs rclone remotes into local
directories, one instance per remote.

## Setup

The service runs as root, so the remote must be configured in root's rclone
config (the one `sudo rclone config` writes), and the instance name must match
both the config file name and the remote name:

```bash
sudo rclone config
sudo cp /etc/rclone-sync/example.conf /etc/rclone-sync/gdrive-docs.conf
sudo vim /etc/rclone-sync/gdrive-docs.conf          # set RCLONE_SRC / RCLONE_DEST
sudo systemctl enable --now rclone-sync@gdrive-docs.timer
```

## Commands

```bash
sudo systemctl start rclone-sync@gdrive-docs.service   # run once now
journalctl -eu rclone-sync@gdrive-docs                 # logs
systemctl list-timers 'rclone-sync@*'                  # next runs

sudo systemctl edit rclone-sync@gdrive-docs.timer      # change the schedule
#   [Timer]
#   OnCalendar=Sat *-*-* 02:00:00
```

## Behaviour

- Remote not configured: `ExecCondition` skips the run, so the unit goes
  inactive, not failed, and `journalctl` shows `Skipped due to 'exec-condition'`.
  The timer retries at its next elapse.
- Config file missing: the unit fails with `Failed to load environment files`.
- Real failure (network, deleted remote, ...): retried every 60 seconds, at
  most 5 starts per hour (`StartLimitBurst`), after that the next timer run.

## Notes

- `rclone sync` mirrors, so it deletes extra files at the destination. Override
  the service with `rclone copy` for append-only behaviour.
- `RCLONE_FLAGS` may hold several whitespace-separated flags; leave it out or
  empty for none.
- Absolute paths only in the config: no shell is involved, so `~` and `$HOME`
  are not expanded.
- Files are owned by root. To change that, override the unit with `User=` and
  `Group=` plus a readable `RCLONE_CONFIG`, or append a `chown` `ExecStart=`
  line (extra `ExecStart=` lines run after the first one).
- Hardening: `ProtectSystem=full` makes `/usr`, `/boot`, `/efi` and `/etc`
  read-only and leaves `/home`, `/srv`, ... writable. Path options expand `%`
  specifiers but never variables, so `ReadWritePaths=` cannot take `RCLONE_DEST`;
  put the literal path in an override when restricting further:

```bash
sudo systemctl edit rclone-sync@gdrive-docs.service
#   [Service]
#   ProtectHome=read-only
#   ReadWritePaths=/home/you/backup/Documents
```
