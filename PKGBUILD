# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=cinnamon-doc
pkgver=6.4.2
_pkgver=xia
pkgrel=1
pkgdesc='Code documentation for various Cinnamon components.'
arch=('any')
url="http://packages.linuxmint.com/pool/backport/c/cinnamon"
license=('GPL-3.0-or-later')
depends=(
    'cinnamon'
    'devhelp'
)
source=("${pkgname}_${pkgver}.deb::${url}/${pkgname}_${pkgver}+${_pkgver}_all.deb")
sha256sums=('8879c0b8f2351842c9fd50366d71479190e8dd5de354c60ef2719eab3005c99e')

package() {
    tar xf "${srcdir}/data.tar.xz"
    cp -r usr "$pkgdir"
}
