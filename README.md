# wegame-dwproton

`wegame-dwproton` is an unofficial Arch Linux package that runs the official Tencent WeGame Windows client in an isolated [DWProton](https://github.com/sbshadadow/awesome-dwproton) prefix.

## Important legal and compatibility notice

This project is not affiliated with, endorsed by, or supported by Tencent, WeGame, or DWProton. Tencent distributes the WeGame installer and client under its own terms. Review the current [WeGame agreement](https://www.wegame.com.cn/contract/) before installing or running the client.

Wine and DWProton are not Tencent-supported WeGame environments and may conflict with Tencent's agreement or service rules. Use this integration only after making your own legal and account-risk assessment. Game launchers, anti-cheat systems, payment flows, and individual games may fail or may change without notice.

The GitHub repository and AUR Git repository contain only integration code and packaging metadata. They do not redistribute the Tencent installer. `makepkg` downloads the unmodified installer directly from Tencent and verifies its SHA-256 digest.

## Installation

Install an AUR helper and the package:

```bash
paru -S wegame-dwproton
```

DWProton is a runtime requirement, but it is not a hard pacman dependency. ProtonUp-Qt installs self-contained compatibility tool archives per user and does not register them in pacman's dependency database. The launcher automatically discovers DWProton in these locations:

- system Steam compatibility tools, including `dwproton` and `dwproton-signed`;
- ProtonUp-Qt's Lutris runners under `~/.local/share/lutris/runners/wine/`;
- per-user Steam compatibility tool directories.

Install DWProton with ProtonUp-Qt before launching WeGame. Alternatively, install the system-wide AUR package with `paru -S dwproton-bin`; that package may require additional host `lib32-*` libraries.

Start **Tencent WeGame (DWProton)** from the application menu or run:

```bash
wegame-dwproton
```

The first launch opens Tencent's official installer. Keep the default installation directory:

```text
C:\Program Files (x86)\WeGame
```

A custom installation directory is intentionally unsupported because update recovery must remain confined to a known, package-owned prefix path. Start `wegame-dwproton` again after the installer finishes.

## Per-user data

No Wine prefix is created during package installation. Runtime data stays in XDG user directories:

| Purpose | Default path |
| --- | --- |
| Proton compatdata | `~/.local/share/wegame-dwproton/compatdata` |
| Wine prefix | `~/.local/share/wegame-dwproton/compatdata/pfx` |
| Update backups | `~/.local/state/wegame-dwproton/update-backups` |
| DXVK cache | `~/.cache/wegame-dwproton/dxvk` |

The matching `XDG_DATA_HOME`, `XDG_STATE_HOME`, and `XDG_CACHE_HOME` variables override these base directories.

## Commands

```text
wegame-dwproton                 Install on first use, otherwise launch WeGame
wegame-dwproton --install       Run the installer when WeGame is absent
wegame-dwproton --recover-update
                                Recover only the confirmed updater failure state
wegame-dwproton --stop          Stop this package's Wine prefix
wegame-dwproton --print-prefix  Print the Wine prefix path
wegame-dwproton --version       Print the package version
```

`WEGAME_DWPROTON_PROTON` overrides automatic DWProton discovery. `WEGAME_DWPROTON_SHARE_DIR` overrides the package data directory for development and tests.

## Confirmed update recovery

The WeGame updater can download a complete `wegame_update` payload and then fail while replacing the installed client under Wine. This package recovers only the observed, narrowly identified failure:

```text
OverwriteStatus=7299004
TickMoveFile=-1
```

Recovery is refused unless all of the following are true:

- both markers are present with the exact values above;
- `update.tmp` and `wegame_update` are regular paths inside the default WeGame directory;
- the payload contains a regular `wegame.exe`;
- the payload contains no symbolic links or special files;
- no process is using this package's prefix.

Before applying files, the launcher moves the update payload and status into a timestamped state backup and copies every overwritten destination file there. Each replacement is staged in the destination directory and atomically renamed. An application failure triggers rollback and restores the pending update files. Unknown or incomplete update states fail closed and are never guessed.

This operation copies Tencent's own downloaded update payload without modifying Tencent binaries. It remains an unsupported compatibility workaround.

## Development

Run the behavior test without Wine:

```bash
tests/test-update-recovery.sh
```

Build the package:

```bash
makepkg --cleanbuild --nodeps
```

`--nodeps` is needed only when the virtual `dwproton` dependency is not installed in the build environment.

## License

The integration code and packaging metadata are licensed under the [0BSD license](LICENSE). Tencent binaries, names, marks, services, and agreements are not covered by 0BSD.
