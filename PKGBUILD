# Maintainer (2022-): Koichi Murase <myoga.murase@gmail.com> (akinomyoga at GitHub)
# Maintainer (2021): capezotte (carana2099 ob gmail at com)

pkgname=blesh
_pkgname=ble.sh
pkgdesc="A replacement for bash's line editor with advanced features"
pkgver=0.3.4
pkgrel=2
license=(BSD)
url='https://github.com/akinomyoga/ble.sh'
depends=(bash)
arch=(any)
source=("https://github.com/akinomyoga/ble.sh/releases/download/v0.3.4/ble-${pkgver}.tar.xz")
sha256sums=('e543a43d211fef8f52b96b2e7935e892581421f759cda4ae87563854ebc60573')
install=blesh.install

package() {
  mkdir -p "${pkgdir}/usr/share/blesh/"
  cp -RpT "${_pkgname%.sh}-${pkgver}" "${pkgdir}/usr/share/blesh/"
}
