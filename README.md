# libfprint-tod-goodix5f10-git

Arch Linux package for the Goodix `27c6:5f10` fingerprint reader TOD module. The package builds the module from the `main` branch of [goodix-5f10-linux-driver](https://github.com/kamazee/goodix-5f10-linux-driver).

Install `libfprint-tod-git` first because Arch's standard `libfprint` package does not load TOD modules. To build this package from a different source branch, set `GOODIX_GIT_BRANCH` when running `makepkg`, for example `GOODIX_GIT_BRANCH=psk-file makepkg -Csi`.

The package installs the author's public PSK as `/var/lib/fprint/goodix-5f10/psk-default`. It only works as a fallback when the sensor has already been provisioned with that key; installing this package does not write to the sensor. The driver first reads `/var/lib/fprint/goodix-5f10/psk`, which should contain the device's recovered Windows key as 32 raw bytes, owned by `root:root` with mode `0600`. It uses `psk-default` only when the personal key file is absent.

After installation, the package hook prints the optional systemd drop-in command for setting `GOODIX_5F10_PSK_FILE` in the system `fprintd` service.
