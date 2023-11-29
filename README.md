# resticctl

The little helper of `restic`.

## Installation

Simply copy the `resticctl` bash script to `/usr/bin` or install it vía
[Arch Linux package](https://aur.archlinux.org/packages/resticctl).

## Configuration

The script reads the configuration in this preference order.

- `RESTICCTL_CONFIGURATION` variable
- `${XDG_CONFIG_HOME:-~/.config}/resticctl/resticctl.conf` user file
- `/etc/resticctl/resticctl.conf` global system file

The configuration is the definition of the environment variables that we
want to be present when `restic` is executed and some variables of the
script itself, which are the following.

- `BACKUP_LOCATIONS`, an array with the paths to include in the backup.
- `FORGET_FLAGS` (optional), an array with the modifiers that we want to
   pass to `restic forget` in case we want it to be executed before the
   `backup` command.


In addition, if in the location of `resticctl.conf` there is a file
`excludes.lst` then this file is used as a list of backup exclusion
patterns.

## Run

The script has help, launch `resticctl` to see the subcommands.

At run time you can declare an environment variable `RESTIC_TAG` to set
a tag for the backup, if none is set, `manual` is used. If you need to
declare multiple tags simply separate them by commas, e.g. `export
RESTIC_TAG=manual,important,system`.

## Using it with systemd

If you want to run `resticctl` with `systemd` you can use the following
examples.

`/etc/systemd/system/resticctl-backup.service`
```systemd
[Unit]
Description=restic backup with resticctl
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
Nice=19
Environment="RESTIC_TAG=scheduled"
SuccessExitStatus=3
ExecStart=/usr/bin/resticctl backup
```

And to schedule it every four hours.

`/etc/systemd/system/resticctl-backup.timer`
```systemd
[Unit]
Description=restic backup with resticctl

[Timer]
OnCalendar=0/4:0
RandomizedDelaySec=30m
Persistent=true

[Install]
WantedBy=timers.target
```
