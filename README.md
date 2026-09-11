# rclone-sync-timer

Systemd user template timer/service that periodically syncs an rclone remote
with a local directory, one instance per remote. It runs as your user and uses
your own rclone config, no root involved.

## Setup

```bash
rclone config                                     # configure the remote
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

## Modes

`RCLONE_MODE` picks the rclone subcommand:

| Mode | Behaviour |
| --- | --- |
| `sync` (default) | One-way mirror: the remote wins. Local files that are not on the remote are **deleted**, changed ones are **overwritten**. |
| `copy` | One-way, adding only: nothing at the destination is deleted, changed files are still overwritten by the remote. |
| `bisync` | Two-way sync, for keeping several machines in step. |

With `copy`, add `--update` to `RCLONE_FLAGS` to keep newer local files.

`rclone sync` and `rclone copy` follow `RCLONE_SRC` only; for a two-way setup
`RCLONE_MODE=bisync` is required, otherwise the first run on each machine will
delete everything that machine has and the remote does not.

### Two-way sync between machines

```ini
RCLONE_MODE=bisync
RCLONE_FLAGS=--resync
```

Run `systemctl --user start rclone-sync@<name>.service` once with `--resync`: it
records the current state of both sides as the common baseline. Do this only
when one side is known to be authoritative, since rclone cannot tell a new file
from a deleted one and will propagate both ways. Remove `RCLONE_FLAGS=--resync`
afterwards, or the baseline is rebuilt on every run and nothing is ever deleted.

Then, on every run, changes on either side are copied to the other. A file
changed on both sides since the last run cannot be merged: the newer version
wins and the older one is kept as `filename.conflict1` next to it.

`bisync` keeps its listings in `~/.cache/rclone/bisync/`; deleting that
directory (or losing it) makes the next run fail until `--resync` is used again.

## Commands

```bash
systemctl --user start rclone-sync@gdrive-docs.service   # run once now
journalctl --user -eu rclone-sync@gdrive-docs            # logs
systemctl --user list-timers 'rclone-sync@*'             # next runs

systemctl --user edit rclone-sync@gdrive-docs.timer      # change the schedule
#   [Timer]
#   OnCalendar=
#   OnCalendar=*-*-* 09,13,20:00:00
```

## Schedule

The default is every 10 minutes while the machine is on, plus one run two
minutes after the user manager starts, which is at login (or at boot with
lingering enabled). `Persistent=true` additionally replays a run that was
missed while the machine was off.

A run is skipped, not queued, if the previous one has not finished yet, so a
short interval is safe for long syncs.

## Behaviour

- Remote not configured: `ExecCondition` skips the run, so the unit goes
  inactive, not failed, and `journalctl` shows `Skipped due to 'exec-condition'`.
  The timer retries at its next elapse.
- Config file missing: the unit fails with `Failed to load environment files`.
- Real failure (network, deleted remote, ...): retried every 60 seconds, at
  most 5 starts per hour (`StartLimitBurst`), after that the next timer run.

## Notes

- Absolute paths only in the config: no shell is involved, so `~` and `$HOME`
  are not expanded.
- `RCLONE_FLAGS` may hold several whitespace-separated flags; leave it out or
  empty for none. `Referenced but unset environment variable ... RCLONE_FLAGS`
  in the log is normal and harmless.
- The units run as your user, so synced files belong to you. File system
  sandboxing (`ProtectSystem=`, `PrivateTmp=`, ...) has no effect in user
  services, so the only hardening set is `NoNewPrivileges=yes`.
