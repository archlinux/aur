# lenopow

> Lenovo Ideapad/LEGION battery conservation mode on Manjaro Linux

**lenopow** allows managing Lenovo Ideapad's/LEGION's firmware on the battery
and shifts between the usual charging thresholds from 95/100% to 55/60%.
In some cases, not charging the battery to 100% constantly may improve
the overall lifespan of the battery. This setting is suggested for a system
that is always plugged into the AC adapter.

## Instalation

The standard `make install` routine is used.

The following additional variables are supported:

- `DESTDIR` -- determines environment for staged installs,
- `PREFIX` -- determines where the script will be installed (default: `/usr/local`).

## Requirements

The script requires the following to run:

- `bash`
- `linux >= 4.14`

## Usage

Run: `lenopow [operation]`

| Operation         | Description                                      |
| :---------------- | :----------------------------------------------- |
| `-h`, `--help`    | Show help message.                               |
| `-v`, `--version` | Show script version.                             |
| `-s`, `--status`  | Show battery protection status.                  |
| `-e`, `--enable`  | Enable battery protection (charge level 55-60%). |
| `-d`, `--disable` | Disable battery protection (charge level 100%).  |

## License

This simple wrapper script, with a definitely too big name, is licensed under the Unlicense - see the [LICENSE](LICENSE) file for details.
