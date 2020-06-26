# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=timg
pkgver=0.9.8
pkgrel=1
pkgdesc="Terminal Image Viewer"
arch=('any')
url="https://github.com/hzeller/timg"
license=('GPL2')
depends=('libwebp' 'graphicsmagick')
source=("timg-$pkgver.tar.gz::https://github.com/hzeller/timg/archive/v$pkgver.tar.gz")
sha256sums=('436e2c3b5f43e906786ca150d11e521281d558329a7bc00198fe30d6907ee8c4')

build() {
  cd $pkgname-$pkgver/src
  make
}

package() {
  cd $pkgname-$pkgver/src
  install -Dm755 timg "$pkgdir"/usr/bin/timg
}
