# Maintainer (2022-): Koichi Murase <myoga.murase@gmail.com> (akinomyoga at GitHub)
# Maintainer (2021): capezotte (carana2099 ob gmail at com)

pkgname=blesh
_pkgname=ble.sh
pkgdesc="A replacement for bash's line editor with advanced features"
pkgver=0.3.3
pkgrel=3
license=(BSD)
conflicts=(blesh-git)
url='https://github.com/akinomyoga/ble.sh'
depends=(bash)
arch=(any)
source=("https://github.com/akinomyoga/ble.sh/releases/download/v0.3.3/ble-${pkgver}.tar.xz")
sha256sums=('a7e66383bd828584e82133ee08ab0bd8074ef0a739eacb835ff0970c3853f33a')
install=blesh.install

package() {
  mkdir -p "${pkgdir}/usr/share/blesh/"
  cp -RpT "${_pkgname%.sh}-${pkgver}" "${pkgdir}/usr/share/blesh/"
}
