# Maintainer: Miguel Berrío <me at miguelberrio dot xyz>

pkgname=pass-file
pkgver=1.0.0
pkgrel=1
pkgdesc="A pass extension for managing files"
arch=('any')
url='https://github.com/dvogt23/pass-file'
license=('GPL3')
depends=('pass')
source=(https://github.com/dvogt23/pass-file/archive/${pkgver}.tar.gz)
sha256sums=('bd3610e60eac168f39e9b9934a2559753ea1d29c5f48942445ebfd46e92bbe5d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
