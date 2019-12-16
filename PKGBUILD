# Maintainer: Vorpal <vorpal@riseup.net>
pkgname=vkdevicechooser
pkgver=1
pkgrel=1
pkgdesc="Vulkan layer to force a specific physical GPU device to be used"
arch=('x86_64')
url="https://github.com/aejsmith/vkdevicechooser"
license=('MIT')
source=(https://github.com/aejsmith/vkdevicechooser/archive/master.zip)
md5sums=('22df9532f1f89855a0db8ad068ba0145')

build() {
  cd "${pkgname}-master"
  make CXXFLAGS="$CXXFLAGS"
}

package() {
  cd "${pkgname}-master"
  make install DESTDIR="${HOME}"
}
