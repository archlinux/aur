# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=stf
pkgver=3.4.1
pkgrel=1
pkgdesc='Web application for controlling and managing Android devices'
arch=(i686 x86_64)
url=https://openstf.io
license=(Apache)
depends=(nodejs
         android-tools
         rethinkdb
         graphicsmagick
         zeromq
         protobuf
         yasm
         pkg-config)
makedepends=(npm)
options=(!strip)

package() {
  npm i -g --prefix="$pkgdir"/usr stf@$pkgver
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
