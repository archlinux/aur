# AUR-azure-kinect-sensor-sdk-git

Created in response to
https://github.com/microsoft/Azure-Kinect-Sensor-SDK/issues/631

You may need to set `LD_LIBRARY_PATH` before running `k4aviewer`.

```console
$ export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib64"
```

---

More of a note for myself, but make sure to regenerate `.SRCINFO` after
new releases before pushing to the AUR.
```console
$ makepkg --printsrcinfo > .SRCINFO
```

Also, the AUR Git remote-url is:

```
ssh://aur@aur.archlinux.org/azure-kinect-sensor-sdk-git.git
```
