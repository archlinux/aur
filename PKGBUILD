# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=stf
pkgver=3.4.0
pkgrel=2
pkgdesc='Web application for debugging Android devices'
arch=(i686 x86_64)
url=https://openstf.io
license=(Apache)
depends=(nodejs-lts-carbon
         rethinkdb
         graphicsmagick
         zeromq
         protobuf
         yasm
         pkg-config)
makedepends=(npm)
options=(!strip)

package() {
  npm install -g --prefix="$pkgdir"/usr stf@$pkgver
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
