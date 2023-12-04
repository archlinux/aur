# Maintainer: Matthew Barichello <matthewjbarichello@gmail.com>
pkgname=arch-efistub-git
_gitsha="7f98c42f84be221d7d9ddbc150d93ccb40fc188a"
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
