pkgname=libcrystalhd
pkgver=20131127
pkgrel=1
pkgdesc="Broadcom Crystal HD library"
arch=('i686' 'x86_64')
url="https://github.com/agx/libcrystalhd"
license=('LGPLv2.1')
source=("$pkgname-$pkgver.zip::https://github.com/agx/libcrystalhd/archive/master.zip")
md5sums=('5f4832657340acaa411aabfc20ca1499')

build() {
  cd "$pkgname-master"
  ./autogen.sh
  make
}

package() {
  cd "$pkgname-master"
  make DESTDIR="$pkgdir" install
}
# vim:syntax=sh
