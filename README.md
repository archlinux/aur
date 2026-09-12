# micdroid-git

AUR package for [micdroid](https://github.com/GG2R10/micdroid-scrcpy)'s system-tray app
(`tray-app/` in that repo) and the daemon it needs - not the KDE Plasma widget, which
stays on the KDE Store / manual-install path, unrelated to this package.

Builds `micdroid_tray` and `micdroid_daemon` as real Python wheels from the upstream
repo's git HEAD (a `-git`/VCS package, version tracks `git rev-list --count` + short
hash), installs the daemon's systemd unit to `/usr/lib/systemd/user/` (running the
system Python directly - no private venv, unlike upstream's own `bootstrap.sh`, since
this package's own `depends=` guarantees the daemon's dependencies are already
system-installed), a `.desktop` launcher, and icons.

## Build/install locally

```bash
makepkg -si
```

## Update after upstream changes

```bash
makepkg --printsrcinfo > .SRCINFO
```
before committing/pushing, so the AUR web listing stays in sync with the PKGBUILD.

## Publish/update on the AUR

```bash
git remote add origin ssh://aur@aur.archlinux.org/micdroid-git.git   # first time only
git push origin master
```
