# Minecraft-ModM

A CLI tool for managing Minecraft mods/plugins for servers.

## About

This project targets server owners, because it might be hard to install mods/plugins in a CLI server interface. I had that problem, and I hated when I had to update my server. So, this is the solution.

## Dependencies

- [libcurl](https://curl.se/libcurl/) (for downloading mods/plugins)
- A C++ compiler with C++20 support (e.g., `g++`)
- `make` utility
- nlohmann/json library

## Binary name

This project's binary is called

```bash
mcmodm
```

## Installation

In order to install this program, you should download a file from `releases` section.
Then, you have to install the program. Installation is different for both Windows and Linux users.

### Windows

1. Download .zip (not the 'Source code' one) from `releases` section
2. Copy it into your home directory, it should work.
3. Run `cmd.exe` (`Win+R`, type `cmd`, press `Enter`), or easier, open terminal from the folder where `mcmodm.exe` is stored. If you do so, skip step 4.
4. `cd` into folder where you extracted zip, the folder is called `wb`.
5. Run `.\mcmodm.exe <options>`
6. You should download CA certificate from <a href='https://curl.se/docs/caextract.html'>here</a> and copy them into the same folder as `mcmodm.exe` if it doesn't work, but now it is included in `.zip`. **Note** that you will have to rename file co `cacert.pem`.

### Linux (Debian)

1. Download `.deb` file
2. Run:

```bash
sudo dpkg-deb -i mcmodm.deb
```

3. Simply run `mcmodm <option>`

### Arch Linux

I've made AUR package called `mcmodm`. Use your favorite AUR helper to install it. Example:

```bash
yay -S mcmodm
```

## Setting up

1. `cd` into the minecraft directory where you extracted the zip. _For Windows users in MinGW64 shell, user home directory is `/C/Users/Username/`_
2. To create a version file, run
   ```bash
   mcmodm setup <path> <version> <loader> (loader)
   ```
   - `req.json` should be in the same folder where mods/plugins will be installed to, **if you disabled automatic path handling during setup. Otherwise (default), it should be minecraft folder**
   - Multiple loaders can be set by listing them after `<version>`.
3. (Optional) Set a default path by creating a config file when running `mcmodm setup ..`. You should press `y` when the setup asks you to, and it will be done.
4. (**For clients ONLY**) When prompted for automatic path management, say **y**(yes). If it is an server, say **n**(no)!
5. You are ready

## Managing instances
Instances are added in v2.0
You can save named installation targets and reuse them across commands.
For example, adding, listing, and removing instances:
```bash
mcmodm instance add prod /srv/minecraft/plugins
mcmodm instance add client ~/.minecraft/mods
mcmodm instance ls
mcmodm instance rm prod
```

Once an instance exists, you can reference it with `-i` instead of typing the path manually:

```bash
mcmodm list -i prod
mcmodm install sodium -i prod
mcmodm remove sodium -i prod
```

You can also bypass the default path or instance completely by passing `-p <path>`:

```bash
mcmodm list -p /srv/minecraft/plugins
mcmodm install sodium -p /srv/minecraft/plugins
```

`-p` and `-i` are supported by most commands and cannot be combined together.

## Usage

Commands:  
**When you have multiple words in some text, put that text in quotes.**

### Global selectors

- `-p <path>`: Use a specific install directory for this command.
- `-i <instance_name>`: Use a saved instance for this command.
- You can use either option in most commands; they are mutually exclusive.
- If neither is provided, the tool will use the configured default path or instance if available.

### Commands

- Search for mod/plugins:  
  `mcmodm search <mod/plugin name>`
- Install mod/plugin(s):  
  `mcmodm install <Project ID>... [options] [Install Path]`  
  Dependencies will be installed. Multiple packages can be installed. Path is optional if default is set.
  Options:
    - `--override-version=1.21.8` and `--override-loader=fabric`. They are used when you want to download **plugins** for version other than configured one.
    - `--vn=mc26.2-0.9.2-alpha.4-fabric`. It installs the specified project by version numbers, also doesn't use setup config.
- Remove mod/plugin(s):  
  `mcmodm remove <Project ID>... [Install Path]`  
  Multiple packages can be removed. Path is optional if default is set.
- List installed plugins:  
  `mcmodm list [Install path]`  
  Path is optional if default is set.
- Update all packages:  
  `mcmodm updateall <new Game version> [Install path]`  
  Path is optional if default is set.
- Install packages easily (follow instructions that appear):  
  `mcmodm easy_install [path]`  
  Path is optional if default is set.
- Remove packages easily (follow instructions that appear):  
  `mcmodm easy_remove [path]`  
  Path is optional if default is set.
- Install all packages from a file:  
  `mcmodm iff <path_to/packages.json> <install-path>`  
  There, `path_to/packages.json` should point to a file.
- Check if all installed packages are available for updating to a specific version and loader:  
  `mcmodm ck_upd <update_version> <loader> [installation_folder]`  
  Path is optional if default is set.
- Install a local .jar file:  
  `mcmodm il <file_to_install> <name> <loader> [path_to_install]`  
  Path is optional if default is set.
- List compatible versions for a project with a specifiable loader:  
  `mcmodm listver <project_id> (loader)`
- Show detailed info for a project:  
  `mcmodm info <project_id>`
- List compatible loaders for specific version of the project:
  `lscompl <version> <project_id>`
- Print information about setup:
  `setupinfo [path]`
- List version numbers:
  `listvernums <project_id> [game_version]`
- Manage saved instances:
  `mcmodm instance add <instance_name> <instance_path>`
  `mcmodm instance rm <instance_name>`
  `mcmodm instance ls`
**IMPORTANT** By `[path]`, I also mean -i/-p. Those two override default path. Also, -i/-p isn't supported for `setup` and all `instance` commands
## Compiling yourself

### App
There is a Makefile. Use `make -j$(nproc)` to compile on Linux/macOS, `sudo make install` to install system-wide. Source files are in `src/` and header files are in `include/`.  
On Windows, steps are similar after installing dependencies, using a MINGW64 shell. You should run `make win -j$(nproc)` in order to make a binary that is somewhat portable. Also, you should run `copyreq.sh` from a subfolder of `Minecraft-ModM` in order to make that binary work outside of MinGW, and also download `cacert.pem` and place it next to the binary.

### Shared library
**NOTE:** The shared library can be built only on Linux so far.
You should run `make shared` to make the shared object file, and then `sudo make install-shared` to install that shared object and headers to system PATH.


## Notes

- In commands above, `Install path` or `Path to req.json` is a directory and thus shouldn't contain `req.json`.
- Paths in brackets `[path]` are optional if a default path is configured.
- (OPTIONAL, BUT USEFUL) Add folder where `mcmodm.exe` is located to the PATH, there are online tutorials for that. If you do that, you can run the program from any place on disk inside of CMD.
- Modrinth API works with both slugs and project IDs, but this tool uses project IDs since they are more reliable, don’t change, and you can't run `mcmodm install sodium [path]`. I tried, it failed
- For Resource packs or datapacks, the loader is called `minecraft`!
## How to use this program?

- Open the shell
- On Windows, cd into the directory where the `mcmodm.exe` is. _It is recommended to install it into your home folder._
- Run desired command.

## Examples

Let's say that I have a minecraft server at `~/.server/`. Plugins are in `plugins/` folder, so this is how you initialize.

```bash
mcmodm setup ~/server/plugins/ 26.1 paper bukkit spigot
```

Then, you can do `easy_install` like this, follow instructions that you get by the program

```bash
mcmodm easy_install
```

## Shared Library

So, if you want to use my shared library with `main.cpp` of this program, you have to make a few changes:
	- change this line `#include "../include/setup.h"` to `#include "pbmcmodm/setup.h"`
	- repeat that for `color.h` and `mcmodm.h`
	- That is it.
