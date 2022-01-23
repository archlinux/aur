# Maintainer (2022-): Koichi Murase <myoga.murase@gmail.com> (akinomyoga at GitHub)
# Maintainer (2021): capezotte (carana2099 ob gmail at com)

pkgname=blesh
_pkgname=ble.sh
pkgdesc="A replacement for bash's line editor with advanced features"
pkgver=0.3.3
pkgrel=2
license=(BSD)
conflicts=(blesh-git)
url='https://github.com/akinomyoga/ble.sh'
depends=(bash)
arch=(any)
source=("git+$url.git#commit=742777e770a8ce22aa76f67cb042f89feb34d631")
sha256sums=('SKIP')
install=blesh.install

package() {
  mkdir -p "${pkgdir}/usr/share/blesh/"
  cp -RpT "${_pkgname%.sh}-${pkgver}" "${pkgdir}/usr/share/blesh/"
}
