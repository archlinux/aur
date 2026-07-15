# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=cinnamon-doc
pkgver=6.6.7
_pkgver=zena
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
sha256sums=('5a1490fbc7451012878e35a1c5bc5020e0466ebe64dab1a9bcff0a61b2eca335')

package() {
    tar xf "${srcdir}/data.tar.xz"
    cp -r usr "$pkgdir"
}
