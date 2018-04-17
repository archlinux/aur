Some notes

# repositories

The repository for this is on AUR:
https://aur.archlinux.org/origamiapp.git/

The release content comes mostly from:
https://github.com/hellonico/origami-electron



remote is at:

ssh://aur@aur.archlinux.org/origamiapp.git

# build

```
makepkg -f
```

Or, when downloading the PKGBUILD file:
```
makepkg -si
```

# release

Taken from the [Arch User Repository](https://wiki.archlinux.org/index.php/Arch_User_Repository#Git_repositories_for_AUR3_packages)

```
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "useful commit message"
git push
```