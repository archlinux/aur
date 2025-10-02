# albafetch ~by alba4k

#### Note: to prevent merge conflicts, please open your pull requests to the "development" branch, and check that one out before doing anything. Master is more stagnant and only updated when I know what I'm currently working on works as expected (most of the time).

![intro](images/albafetch.png)

albafetch is a simple and fast program to display a lot of system information in a neofetch-like layout in way less than a second. I decided to make this as a challenge for myself and since I found neofetch too slow (which is understandable given that we're talking about a 10k+ lines shell script).

<details>

<summary>Preview</summary>
This is what albafetch will likely look like by default:

![default](images/albafetch_demo_default.png)

And this is what [my configuration](https://github.com/alba4k/.dotfiles/blob/master/.config/albafetch/albafetch.conf) looks like
![custom](images/albafetch_demo.png)

</details>

Here is a time comparison (exact execution times change between machines and runs):
<details>

<summary>Time comparison</summary>

![neofetch](images/time_neofetch.png)
![albafetch](images/time_albafetch.png)

</details>

You will find a lot of useful usage and configuration related info inside of the [user manual](MANUAL.md) and a small list of the things I changed since the last release in the [changelog](CHANGELOG.md).

It currently supports a lot of GNU/Linux distributions, macOS (both x64 and arm64 macs) and even Android (only tested in Termux).
Feel free to test any other platform :)

## Table of contents
1. [Dependencies](#dependencies)
	* [For building](#build-dependencies)
	* [At runtime](#runtime-dependencies)
2. [Compilation](#compilation)
	* [make](#using-the-makefile)
	* [meson](#using-meson)
	* [nix](#using-nix)
3. [Installation](#installation)
	* [Arch BTW](#for-arch-linux)
	* [NixOS](#for-nixos)
  * [MacPorts](#for-older-macos-versions)
	* [Manually](#manual-installation)
4. [Configuration](#configuration)
	> [example config](albafetch.conf)
5. [Contributing](#contributing)

# Dependencies

## Build dependencies
These will usually also install the relative [runtime dependencies](#runtime-dependencies).
Dependencies marked with an asterisk are optional. This means that if they're not installed at compile-time, albafetch will be compiled with custom implementations of some functions.

* [libpci](https://github.com/pciutils/pciutils)\*:
  Used to get gpu information
	- On Arch Linux, [pciutils](https://archlinux.org/packages/core/x86_64/pciutils)
	- On Debian, [libpci-dev](https://packages.debian.org/bookworm/libpci-dev)
	- On Fedora, [pciutils-devel](https://packages.fedoraproject.org/pkgs/pciutils/pciutils-devel)
	- On Alpine Linux, [pciutils-dev](https://pkgs.alpinelinux.org/package/edge/main/x86_64/pciutils-dev)
* [sqlite3](https://www.sqlite.org):
  Used to gather the amount of installed rpm packages
  - On Arch Linux, [sqlite](https://archlinux.org/packages/core/x86_64/sqlite)
  - On Debian, [libsqlite3-dev](https://packages.debian.org/bookworm/libsqlite3-dev)
  - On Fedora, [sqlite-devel](https://packages.fedoraproject.org/pkgs/sqlite/sqlite-devel)
  - On Alpine Linux, [sqlite-dev](https://pkgs.alpinelinux.org/package/edge/main/x86_64/sqlite-dev)
* [libc](https://www.gnu.org/software/libc) (likely already installed):
	- On Alpine Linux, [musl-dev](https://pkgs.alpinelinux.org/package/edge/main/x86_64/musl-dev)
* [glib](https://docs.gtk.org/glib/)\*:
  Provides some useful abstractions
  - On Arch Linux, [glib2]((https://archlinux.org/packages/core/x86_64/glib2))
  - On Debian, [libglib2.0-dev](https://packages.debian.org/bookworm/libglib2.0)
  - On Fedora, [glib2-devel](https://packages.fedoraproject.org/pkgs/glib2/glib2-devel)
  - On Alpine Linux, [glib-dev](https://pkgs.alpinelinux.org/package/edge/main/x86/glib)
* [git](https://git-scm.com)\*:
  When building from this repo, used to add the commit hash in the `--version` output
* A build system:
  To build the project
	- A [Makefile](https://www.gnu.org/software/make) exists (which uses [meson](https://mesonbuild.com/Getting-meson.html), [ninja](https://github.com/ninja-build/ninja/wiki/Pre-built-Ninja-packages) and [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config)/[pkgconf](http://pkgconf.org)), more details are found [here](#compilation).

## Runtime dependencies
I would like to eventually remove those, by checking at runtime if they are installed and avoid using them them if they're not.
Dependencies marked with an asterisk are optional. This means that if not installed at compile-time, albafetch will be compiled with custom implementations of the functions used. If the binary was compiled with the dependency installed, however, it will be needed at runtime too.

* [libpci](https://github.com/pciutils/pciutils)\*:
	- On Arch Linux, [pciutils](https://archlinux.org/packages/core/x86_64/pciutils)
	- On Debian, [libpci3](https://packages.debian.org/buster/libpci3)
	- On Fedora, [pciutils-libs](https://packages.fedoraproject.org/pkgs/pciutils/pciutils-libs)
  - On Alpine Linux, [pciutils-dev](https://pkgs.alpinelinux.org/package/edge/main/x86_64/pciutils)
* [sqlite3](https://www.sqlite.org):
  - On Arch Linux, [sqlite](https://archlinux.org/packages/core/x86_64/sqlite/)
  - On Debian, [sqlite3](https://packages.debian.org/bookworm/sqlite3)
  - On Fedora, [sqlite](https://packages.fedoraproject.org/pkgs/sqlite/sqlite)
  - On Alpine Linux, [sqlite](https://pkgs.alpinelinux.org/package/edge/main/x86_64/sqlite)
* [glib](https://docs.gtk.org/glib/)\*:
  - On Arch Linux, [glib2]((https://archlinux.org/packages/core/x86_64/glib2))
  - On Debian, [libglib2.0-dev](https://packages.debian.org/bookworm/libglib2.0)
  - On Fedora, [glib2-devel](https://packages.fedoraproject.org/pkgs/glib2/glib2)
  - On Alpine Linux, [glib-dev](https://pkgs.alpinelinux.org/package/edge/main/x86/glib)
* there must be a `sh` binary in your PATH. This should already be satisfied on any UNIX-like system

# Compilation

## Using the Makefile

This will need you to have a C compiler installed and will still use meson/ninja under the hood.

```shell
$ git clone https://github.com/alba4k/albafetch
$ cd albafetch
$ make
```

## Using meson

If you prefer to build with meson/ninja directly, you can use these commands:

```sh
$ git clone https://github.com/alba4k/albafetch
$ cd albafetch
$ meson setup build
$ meson compile -C build
```

In both cases, an executable file should appear as `build/albafetch` if the compilation succeeds.

### Debug builds
It is possible to build a debug binary (`build/debug`) that will test every single function and make sure it runs correctly. This can be done by running

```sh
$ make debug
```

## Using meson

If you prefer to build with meson/ninja directly, you can use these commands:

```sh
$ meson setup build
$ meson compile -C build
$ build/debug
```

## Using nix

Building with nix can make compiling in some ways much easier, such as when compiling statically
or cross compiling. A few convenience outputs are included:

```sh
nix build .#albafetch # regular, dynamically linked build
nix build .#albafetch-static # statically linked build (only available on linux)
nix build .#albafetch-arm # cross compiling from x86_64 to arm (only available on x86_64)
```

# Installation

## For Arch Linux
An AUR package is available, [albafetch-git](https://aur.archlinux.org/packages/albafetch-git).
There are three packages on the AUR that provide albafetch:
* [albafetch](https://aur.archlinux.org/packages/albafetch-) will compile the source code of the latest release
* [albafetch-bin](https://aur.archlinux.org/packages/albafetch-bin) will install a pre-compiled binary from the latest release
* [albafetch-git](https://aur.archlinux.org/packages/albafetch-git) will compile the source of the latest commit in master

You can find more information on how to install packages from the AUR in the [Arch Wiki](https://wiki.archlinux.org/title/Arch_User_Repository#Installing_and_upgrading_packages)

## For Debian
You can create a DEB package from the repo itself

This can be done via a guided procedure

```
$ git clone https://github.com/alba4k/albafetch
$ cd albafetch

$ make deb
```

This will create a deb package for you and ask if you want to install it.

## For NixOS

`nix profile`:

```sh
$ nix profile install .#albafetch
```

`nix-env`:

```sh
$ nix-env -iA packages.<your platform>.albafetch # platform examples: x86_64-linux, aarch64-linux, aarch64-darwin
```

Using the overlay (Flake):

```nix
{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    albafetch = {
      url = "github:alba4k/albafetch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, albafetch, ...}: {
    nixosConfigurations.host = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        {
          nixpkgs.overlays = [albafetch.overlays.default];
          environment.systemPackages = [pkgs.albafetch];
        }
      ];
    };
  };
}
```

Using the overlay (`builtins.fetchTarball`):

```nix
{pkgs, ...}: {
  nixpkgs.overlays = [(import (builtins.fetchTarball "https://github.com/alba4k/albafetch/master.tar.gz")).overlays.default];
  environment.systemPackages = with pkgs; [
    albafetch
  ];
}
```

## For older macOS versions

On older macOS (~11 and lower) versions, albafetch likely won't build natively.

You can, however, install albafetch on those using the [package](https://ports.macports.org/port/albafetch) on MacPorts

This can be easily done with the following
```
# port install albafetch 
```

## Manual installation

What if your OS is not included in the ones mentioned?
In this case, you can either compile the source code yourself and install albafetch manually, or you can grab an executable from the [latest release](https://github.com/alba4k/albafetch/releases/latest).

Please note that albafetch currently won't run on Windows (despite `albafetch --logo windows` being an option), but I'm planning to eventually add support (sooner or later). Feel free to help :)

```
$ git clone https://github.com/alba4k/albafetch
$ cd albafetch

$ make
# make install
```

`make install` needs elevated privileges on Linux (e.g. `sudo` or a root shell) to write to `/usr/bin`, while `/usr/local/bin` can be accessed as a normal user *on macOS*.

Alternatively, you may prefer meson to perform the installation:

```
$ git clone https://github.com/alba4k/albafetch
$ cd albafetch
$ meson setup build
$ meson compile -C build
$ meson install -C build
```

Meson will install the executable to `/usr/local/bin`, which you may or may not want (executables in this directory are ran instead of ones in `/usr/bin`).

# Configuration

albafetch can be customized using a config file, usually `~/.config/albafetch.conf` for your user or `/etc/xdg/albafetch.conf`.

You can find an example configuration file (which only provides the default values of every option) [here](albafetch.conf).
Although this file includes some short comments on how the various options work, I highly recommend checking out the [user manual](MANUAL.md) for a deeper understanding of the way this config file works.

# Contributing

Almost everything included in this program is written in C.

If you want to, you can directly modify the source code contained in this repository and recompile the program afterwards to get some features you might want or need.

New logos can be added in [`src/logos.h`](src/logos.h) (be careful to follow the format), new infos in `src/info` and [`src/info/info.h`](src/info/info.h). Config options are mainly parsed in [`src/utils.c`](src/utils.c). You will also need to edit [`src/main.c`](src/main.c) afterwards to fully enable the new features.

Don't mind opening a pull request if you think some of the changes you made should be in the public version. Please run `clang-tidy --fix src/**/*{.c,.h}` to check for any issues and `clang-format -i src/**/*{c,h}` to make sure the code style is consistent with the rest of the project before committing.

Any contribution, even just a fix of a typo, is highly appreciated.

---

###### © Aaron Blasko

###### Initially started in March 2022
