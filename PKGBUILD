# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=reflector-nomirrorlist
pkgver=1.0.0
pkgrel=1
pkgdesc="Use reflector-generated mirrorlist by default"
arch=('any')
url="https://aur.archlinux.org/packages/reflector-mirrorlist/"
license=('unknown')
depends=('pacman' 'reflector')
provides=('pacman-mirrorlist')
conflicts=('pacman-mirrorlist')
replaces=('pacman-mirrorlist')
install="${pkgname}.install"
backup=('etc/pacman.d/mirrorlist')
source=()

package() {
    # we do nothing, everything is in .install
    return 0
}
