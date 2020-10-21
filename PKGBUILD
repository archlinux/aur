# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=reflector-nomirrorlist
pkgver=1.0.0
pkgrel=3
pkgdesc="Use reflector-generated mirrorlist by default"
arch=('any')
url="https://aur.archlinux.org/packages/reflector-nomirrorlist/"
license=('custom:WTFPL')
depends=('pacman' 'reflector')
provides=('pacman-mirrorlist')
conflicts=('pacman-mirrorlist')
replaces=('pacman-mirrorlist')
install="${pkgname}.install"
source=('LICENSE')

package() {
    # mirrorlist generated in .install post_install function

    # license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('66b76d3df5917f4b5827e7c36d864e10')
