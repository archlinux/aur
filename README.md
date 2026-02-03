# Nucleus

`nucleus` is the command-line interface for managing and running **Nucleus Shell**, a modern Wayland shell built on **QuickShell** for **Hyprland**.

This repository contains the **cli** for **nucleus-shell**

---

## Features

* Start and stop Nucleus Shell
* Reload running QuickShell instances
* Foreground (debug) and daemonized modes
* Plugin management namespace
* Install and Update nucleus-shell
* Manage quickshell ipc's

---

## Requirements

* Linux
* Hyprland
* QuickShell (available in `$PATH`)
* Go ≥ 1.25

---

## Installation

### Build from source

```sh
git clone https://github.com/unf6/nucleus.git nucleus-cli
cd nucleus-cli
go mod tidy
go build
```

(Required)

```sh
sudo mv nucleus /usr/local/bin/
```

---

## Usage

```sh
nucleus <command> [flags]
```

---

## Commands

### `nucleus run`

Start the Nucleus Shell using QuickShell.

```sh
nucleus run
```

#### Flags

```Nucleus is a beautiful, customizable shell built to get things done

Usage:
  nucleus [command]

Available Commands:
  completion  Generate the autocompletion script for the specified shell
  help        Help about any command
  install     Install or Update Nucleus Shell
  ipc         Interact with the shell via IPC
  plugins     Manage Nucleus Shell plugins
  run         Start The Nucleus Shell

Flags:
  -h, --help   help for nucleus

Use "nucleus [command] --help" for more information about a command.
```

#### Examples

Run normally (daemonized):

```sh
nucleus run
```

Run in foreground:

```sh
nucleus run --debug
```

Restart shell cleanly:

```sh
nucleus run --reload
```

---

### `nucleus plugins`

Plugin management command namespace.

```sh
nucleus plugins
```

Plugin sources:

* Official: `https://github.com/xZepyx/nucleus-plugins.git`

---

## Configuration Paths

The CLI expects Nucleus Shell to be installed at:

```text
~/.config/quickshell/nucleus-shell/
```

Required file:

```text
shell.qml
```

The shell is considered **installed** if this file exists:

```text
~/.config/quickshell/nucleus-shell/shell.qml
```

If missing, `nucleus run` will refuse to start.

---
## Related Repositories

* nucleus-shell: https://github.com/xZepyx/nucleus-shell
* nucleus-plugins: https://github.com/xZepyx/nucleus-plugins
* nucleus-colorschemes: https://github.com/xZepyx/nucleus-colorschemes
* nucleus(cli): https://github.com/unf6/nucleus (this repo)
* zenith(ai backend): https://github.com/xZepyx/zenith
 
---
