# wegame-dwproton

`wegame-dwproton` is an unofficial Arch Linux package that runs the official Tencent WeGame Windows client in an isolated prefix using a bundled [DWProton](https://dawn.wine/dawn-winery/dwproton) release.

## Important legal and compatibility notice

This project is not affiliated with, endorsed by, or supported by Tencent, WeGame, or DWProton. Tencent distributes the WeGame installer and client under its own terms. Review the current [WeGame agreement](https://www.wegame.com.cn/contract/) before installing or running the client.

Wine and DWProton are not Tencent-supported WeGame environments and may conflict with Tencent's agreement or service rules. Use this integration only after making your own legal and account-risk assessment. Game launchers, anti-cheat systems, payment flows, and individual games may fail or may change without notice.

The GitHub repository and AUR Git repository contain only integration code and packaging metadata. They do not redistribute the Tencent installer or DWProton archive. `makepkg` downloads the unmodified installer directly from Tencent and DWProton directly from Dawn Winery, then verifies their pinned cryptographic digests.

## Installation

Install an AUR helper and the package:

```bash
paru -S wegame-dwproton
```

The AUR build downloads DWProton `11.0-12` directly from its official Dawn Winery release, verifies the upstream SHA-512 digest, and installs it under `/usr/share/wegame-dwproton/dwproton`. No separate ProtonUp-Qt or `dwproton-bin` installation is required. The DWProton archive is approximately 322 MiB, so the initial AUR build is substantially larger than the integration code.

System graphics drivers and their Vulkan userspace components remain host responsibilities. The package bundles DWProton itself, not GPU drivers.

Start **Tencent WeGame (DWProton)** from the application menu or run:

```bash
wegame-dwproton
```

On a `niri` session, the launcher normally runs WeGame in a rootful Xwayland server sized to the focused output. This preserves DRI3/Present support required by games and applies a cursor only to the identified WeGame client and its TWM frame. If the login layer remains visible, the launcher fully stops that Wine desktop and restarts WeGame in a fixed `960x540` Xephyr display, where the split rendering and interaction layers share one coordinate space and the password caret and mask are visible. After login, it waits for the old Wine desktop to exit before restarting WeGame in rootful Xwayland. Other desktop sessions continue to use the host X11 display directly.

The first launch opens Tencent's official installer. Keep the default installation directory:

```text
C:\Program Files (x86)\WeGame
```

A custom installation directory is intentionally unsupported because update recovery must remain confined to a known, package-owned prefix path. Start `wegame-dwproton` again after the installer finishes.

The Wine fallback system tray is disabled because rootless Wayland sessions without an XEmbed tray expose it as a small white window. WeGame therefore has no Wine fallback tray icon; use `wegame-dwproton --stop` when the client cannot be closed from its main window.

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

The bundled `/usr/share/wegame-dwproton/dwproton/proton` runtime is preferred. `WEGAME_DWPROTON_PROTON` explicitly overrides it; existing system, Lutris, and Steam DWProton installations remain fallback locations. `WEGAME_DWPROTON_SHARE_DIR` overrides the package data directory for development and tests.

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

A strict status-only `update.tmp` produced by a normal WeGame exit is accepted only when it contains the observed `[tgp]` schema, unique expected fields, a valid GUID, and no update payload. Unknown keys, duplicate fields, malformed values, or partial states still fail closed.

This operation copies Tencent's own downloaded update payload without modifying Tencent binaries. It remains an unsupported compatibility workaround.

## Development

Run the behavior tests without Wine:

```bash
tests/test-bundled-runtime.sh
tests/test-launch-lifecycle.sh
tests/test-update-recovery.sh
tests/test-nested-x11-fix.sh
tests/test-niri-x11-launch.sh
```

Build the package:

```bash
makepkg --cleanbuild --syncdeps
```


## License

The integration code and packaging metadata are licensed under the [0BSD license](LICENSE). The bundled DWProton files retain their upstream licenses, which are installed under `/usr/share/licenses/wegame-dwproton/dwproton`. Tencent binaries, names, marks, services, and agreements are not covered by 0BSD.
