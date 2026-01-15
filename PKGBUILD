# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=cinnamon-doc
pkgver=6.6.4
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
sha256sums=('7328a44bc98cc98e0d8eb21ca969a164338234452be4cab4ff02a05f98ee7671')

package() {
    tar xf "${srcdir}/data.tar.xz"
    cp -r usr "$pkgdir"
}
