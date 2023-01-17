# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=cinnamon-doc
pkgver=5.6.7
_pkgver=vera
pkgrel=1
pkgdesc='Code documentation for various Cinnamon components.'
arch=('any')
url="http://packages.linuxmint.com/pool/backport/c/cinnamon"
license=(GPL3)
depends=(
    cinnamon
    devhelp
)
source=("${pkgname}_${pkgver}.deb::${url}/${pkgname}_${pkgver}+${_pkgver}_all.deb")
sha256sums=('4f46156a7ad712809093f000e1875d3109d1e42a3c3a93db4dc2c816494f2bad')

package() {
  tar xf "${srcdir}/data.tar.xz"
  cp -r usr "$pkgdir"
}
