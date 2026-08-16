# kytyps5-nightly-bin

[KytyPS5](https://github.com/KytyPS5/KytyPS5), a PlayStation 5 emulator, packaged
from upstream's prebuilt Linux nightly releases. Nothing is compiled — the
archive bundles its own Qt 6 runtime.

These are nightly builds of an early-stage emulator: expect crashes, graphical
glitches and low compatibility. Report emulator bugs
[upstream](https://github.com/KytyPS5/KytyPS5/issues), not against this package.

## Requirements

A Vulkan 1.3 capable GPU with current drivers.

## Running

Run `kytyps5`, or start **KytyPS5** from the desktop menu.

The launcher opens the emulator in a terminal window when it finds one
(`$TERMINAL`, `konsole`, `kitty`, `xterm`, …) and runs it without one otherwise.

## Files

| Path | What |
| --- | --- |
| `/opt/kytyps5` | The emulator and its bundled Qt runtime |
| `~/.config/Kyty/Kyty.ini` | Launcher settings |
| `~/.local/share/kytyps5` | Working directory: logs, `_SaveData`, and links into `/opt` |

`/usr/bin/kytyps5` is a small wrapper rather than a symlink. The upstream
launcher writes a helper script next to its own executable and runs the emulator
with that directory as the working directory, so it cannot run from a read-only
`/opt`; the wrapper gives it a writable directory under `~/.local/share`
instead.

Save data lives in `~/.local/share/kytyps5/_SaveData/<title-id>`, so back that
up before deleting the directory. The symlinks and the copied launcher beside it
are rebuilt on the next launch.
