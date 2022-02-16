# NVidia eXec - `nvx`

`nvx` is a script to run programs on Pascal and older (<= 10 series) nvidia optimus setups with power management. `nvx`
tries to be extremely simple to install and use, and supports both Xorg and Wayland environments.

Note: This script is highly experimental and require very recent versions of nvidia drivers and gnome patches to work.

## Usage

The script requires `sudo` to toggle the GPU and modules. You might be asked to input your password before the program
starts (to initialize the device), and after the program finishes (to cleanup resources).

1. run `nvx start [program]`
2. that is it

`nvx start` may be called multiple times, its is only going to initialize the devices in the first call and clean
resources when the last call ends.

### Other actions

-   `nvx on` - Turn on the gpu and load the nvidia modules.
-   `nvx off` - Turn off the gpu and unload the nvidia modules. This command may hang if there are programs using it.
-   `nvx off-kill` - Kill processes using the gpu and turn it off (may still hang).
-   `nvx off-boot` - Only turn off the gpu since the nvidia modules are blacklisted.
-   `nvx status` - Print **on** or **off** to indicate the current gpu status.
-   `nvx processes` - Print all processes using the gpu. In case `nvx off` hangs, you can list the processes and stop
    them manually, after that, the `nvx off` will complete
-   `nvx kill` - Kill all processes using the gpu. Some applications might still spawn another process immediately (e.g.
    google chrome), preventing the gpu from turning off.

## Installation

Currently, this package is only available for Arch Linux on the _Arch User Repository_.

Installing the package the package:

```shell
$ git clone https://aur.archlinux.org/nvidia-exec.git
$ cd nvidia-exec
$ makepkg -si
$ ...
```

You may also install the package using an AUR helper:

```shell
$ paru -Sa nvidia-exec
$ ...
$ # or
$ yay -Sa nvidia-exec
$ ...
$ # or whatever helper you might use
```

### After the installation

Once the package is installed, its systemd service must be enabled:

```
$ sudo systemctl enable nvx
```

The `nvx.service` prevents nvidia modules from loading and turn off the graphics card during boot.

It is not necessary to handle files, configurations, PCI buses, etc, all that is done automatically.

### Files

For other users that may want to create a package to their preferred systems, the following is where I place the files
on Arch Linux.

-   **nvx** -> _/usr/bin/nvx_ - Script that handles the gpu and run programs
-   **nvx.service** -> _/usr/lib/systemd/system/nvx.service_ - Service that turns off gpu during boot
-   **modprobe.conf** -> /usr/lib/modprobe.d/nvx.conf - Blacklisted modules
