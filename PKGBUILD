# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=cinnamon-doc
pkgver=4.8.3
_pkgver=ulyssa
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
sha256sums=('a01dd62a3c1e5e9517c9f8f52e221388b0ba1261a5771a95a93d53b1019fc918')

package() {
  tar xf "${srcdir}/data.tar.xz"
  cp -r usr "$pkgdir"
}
