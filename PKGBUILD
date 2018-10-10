# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=timg
pkgver=0.9.5
pkgrel=2
pkgdesc="Terminal Image Viewer"
arch=('any')
url="https://github.com/hzeller/timg"
license=('GPL2')
depends=('graphicsmagick')
source=("timg-$pkgver.tar.gz::https://github.com/hzeller/timg/archive/v$pkgver.tar.gz")
sha256sums=('285f51e95bed3d477b585db2998ef10b32c230d64d8015748e45f9a6e013ce48')

build() {
  cd $pkgname-$pkgver/src
  make
}

package() {
  cd $pkgname-$pkgver/src
  install -Dm755 timg "$pkgdir"/usr/bin/timg
}
