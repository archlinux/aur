# Maintainer: Matthew Barichello <matthewjbarichello@gmail.com>
pkgname=arch-efistub-git
_gitsha="8a0d12bd507d011a7a359b012550a5df08a4b95cv"
pkgver=5.0
pkgrel=1
arch=("x86_64")
url="https://github.com/Matthewacon/arch-efistub"
groups=()
depends=("binutils" "pacman" "systemd" "systemd-ukify")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=("git+https://github.com/Matthewacon/arch-efistub#commit=${_gitsha}")
license=('MIT')
md5sums=('SKIP')
pkgdesc="Builds a unified EFISTUB kernel, bootable from a single file"

package () {
    install -D -m755 ${srcdir}/${pkgname}/efistub ${pkgdir}/usr/bin/efistub
    install -D -m644 ${srcdir}/${pkgname}/rebuild-efistub.hook ${pkgdir}/etc/pacman.d/hooks/rebuild-efistub.hook
}
