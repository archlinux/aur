# µBackup

µBackup uses systemd timers to create local incremental backups and pull them from remote hosts.

On each host where you install either service, install and apply the tmpfiles rules. They create `/var/backups` and an empty `/etc/local-backup.conf` if either path is missing.

```sh
sudo install -m 644 ubackup.tmpfiles /etc/tmpfiles.d/ubackup.conf
sudo systemd-tmpfiles --create ubackup.conf
```

## Local backups

`local-backup.timer` runs daily at 03:00 with a randomized delay of up to 10 minutes. The service uses GNU tar and `zstd` to write `<hostname>-<timestamp>.tar.zst` archives to `/var/backups`. It tracks incremental backups in `<hostname>.snar` in the same directory.

Install the units on each host you want to back up.

```sh
sudo install -m 644 local-backup.service local-backup.timer /etc/systemd/system/
```

Use the supplied `local-backup.conf` as a starting point for `/etc/local-backup.conf` before enabling the timer. `BACKUP_PATHS` is required. Separate paths with spaces and quote individual paths that contain spaces. `EXTRA_OPTIONS` is optional and accepts tar options such as `--exclude`.

```ini
BACKUP_PATHS='/etc /home "/srv/my data"'
EXTRA_OPTIONS='--exclude=/home/*/.local/share/Trash --exclude=/home/*/.local/state'
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now local-backup.timer
```

## Pulling remote backups

`backup-pull@.timer` runs daily at 05:00 with a randomized delay of up to 10 minutes. Each instance uses rsync over SSH to copy a remote host's `/var/backups/` into the collector's `/var/backups/`.

Install the template units on the collector. Install rsync on both hosts and configure SSH so the collector's root account can connect without prompts and read the remote backup directory. Use the remote hostname or an SSH host alias as the timer instance. This example uses `backup-host`.

```sh
sudo install -m 644 backup-pull@.service backup-pull@.timer /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now backup-pull@backup-host.timer
```
