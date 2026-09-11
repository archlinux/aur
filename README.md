# rclone-sync-timer

Systemd user template timer/service that periodically syncs rclone remotes into
local directories, one instance per remote. It runs as your user and uses your
own rclone config, no root involved.

## Setup

```bash
rclone config                                     # configure the remote to sync
mkdir -p ~/.config/rclone-sync
cp /usr/share/doc/rclone-sync-timer/example.conf ~/.config/rclone-sync/gdrive-docs.conf
$EDITOR ~/.config/rclone-sync/gdrive-docs.conf    # set RCLONE_SRC / RCLONE_DEST
systemctl --user enable --now rclone-sync@gdrive-docs.timer
```

The instance name must be the same in all three places: the unit instance, the
config file `~/.config/rclone-sync/<name>.conf` and the rclone remote name.

To sync while logged out, let your user manager start at boot:

```bash
loginctl enable-linger $USER
```

## Commands

```bash
systemctl --user start rclone-sync@gdrive-docs.service   # run once now
journalctl --user -eu rclone-sync@gdrive-docs            # logs
systemctl --user list-timers 'rclone-sync@*'             # next runs

systemctl --user edit rclone-sync@gdrive-docs.timer      # change the schedule
#   [Timer]
#   OnCalendar=Sat *-*-* 02:00:00
```

## Schedule

The default is daily at 03:00. `Persistent=true` covers a machine that is off at
that time: the missed run happens shortly after the next start of the user
manager, i.e. at your next login, or at boot with lingering enabled. Override
the timer to pick another time or to run several times a day (repeat the
`OnCalendar=` line).

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
- The units run as your user, so backed-up files belong to you. File system
  sandboxing (`ProtectSystem=`, `PrivateTmp=`, ...) has no effect in user
  services, so the only hardening set is `NoNewPrivileges=yes`.
