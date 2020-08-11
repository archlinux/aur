# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=cinnamon-doc
pkgver=4.6.7
_pkgver=ulyana
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
sha256sums=('6fa4bdfc9116d5e9ad4bb847c026eaf89ef9e484fb8b7b3bf8cf41cde92efa86')

package() {
  tar xf "${srcdir}/data.tar.xz"
  cp -r usr "$pkgdir"
}
