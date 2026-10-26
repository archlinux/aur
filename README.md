# eve-wrench-git Arch package

This local VCS package follows EVE Wrench's upstream `main` branch and installs
the application through pacman.

Build and install it with:

```sh
makepkg -si
```

Rerun that command to fetch new upstream commits and build an updated package.

Before publishing changes to the AUR, regenerate `.SRCINFO`:

```sh
makepkg --printsrcinfo > .SRCINFO
```
