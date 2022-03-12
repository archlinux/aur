# template-aur-bin

Install your `java application` as native arch linux package.

## A few words about terminology
- `AUR` is a git repository `https://aur.archlinux.org/`
- `PKGBUILD` is a package build script contains both metadata and lifecycle script hooks
- `makepkg` is a build tool. It reads `PKGBUILD` and outputs a `$pkgname-$pkgver.tar.zst` package
- `pacman` is an offical Arch Linux package manager. It can install your fresh package file.
- `pikaur` is an unoffical AUR helper tool. It can download, build and install packages from AUR.

## First steps:
- sign up the aur website and register your ssh public key `~/.ssh/id_rsa.pub`
- clone template repo: `git clone https://github.com/mezlogo/template-aur-bin`
- create by cloning your future aur repo: `git clone ssh://aur@aur.archlinux.org/${{ MY_COOL_APP }}.git`
- move everything from `template-aur-bin`
- replace your package name, version, description, sources and package file

## How to update version:
1. remove package: `sudo pacman -Rns template-for-java-cli-app-github-integrated-aur`
2. update version field inside: `PKGBUILD`
3. download latest release: `makepkg -o`
4. copy new md5sum: `md5sum template-for-java-cli-app-github-integrated-aur-0.0.5.zip | cut -d ' ' -f1`
5. update md5sum field inside: `PKGBUILD`
6. test locally: `makepkg -csrfi`
7. remove package again
8. generate new `.SRCINFO`: `makepkg --printsrcinfo > .SRCINFO`
9. commit and push: 
10. install from aur:
