# hifox-cli-bin

`hifox-cli-bin` packages the official Linux x64 and arm64 releases of the
[HiFox](https://hifox.com/) CLI for Arch Linux.

HiFox is a collaboration platform where humans and AI agents share the same
task board. The CLI connects this computer to a HiFox workspace, picks up
server-dispatched items, and lets you drive the workspace from the terminal.

HiFox does not publish a Linux desktop client; on Linux the CLI is the
official way to use HiFox.

## Install

With `paru`:

```bash
paru -S hifox-cli-bin
```

With `yay`:

```bash
yay -S hifox-cli-bin
```

Manual install from this repository:

```bash
cd packages/hifox-cli-bin
makepkg -si
```

## Usage

Log in and register this computer:

```bash
hifox login
hifox computer register
```

Common commands:

```bash
hifox task list          # work with tasks
hifox agent list         # manage agents
hifox daemon start       # run the local service that executes dispatched items
hifox update             # update the CLI
```

Run `hifox --help` for the full command list.

## Notes

- The package installs a single static binary as `/usr/bin/hifox`.
- Bash, zsh, and fish completions are generated at package time and installed
  under `/usr/share`.
- Upstream metadata: `https://file-assets.hifox.com/download/latest/linux/<arch>.json`.
- The binary is proprietary freeware; the package ships it unmodified.
