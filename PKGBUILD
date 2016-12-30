# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

_pkgname=KeeSecurityCheck
pkgname=keepass-plugin-keesecuritycheck
pkgver=1.0
pkgrel=1
pkgdesc="KeePass plugin to perform a security audit of your passwords"
license=('GPL')
depends=('keepass')
arch=('any')
url="https://github.com/hmc-soft/KeeSecurityCheck"
source=("https://github.com/hmc-soft/${_pkgname}/releases/download/v${pkgver}/${_pkgname}.plgx")
sha512sums=('1faaefaf568aedbbc3a29529360a2d1d94dfbeffba01068dad1ac03655769c1c7ca4ad784874ff149e4289ffad720057c508ed97639a690240740227c22e97f0')

package() {
    install -Dm644 "${srcdir}"/${_pkgname}.plgx "${pkgdir}"/usr/share/keepass/plugins/${_pkgname}.plgx
}
