# Maintainer: Zach Hoffman <zach@zrhoffman.net>

pkgname=docksal
pkgver=1.12.3
pkgrel=1
epoch=1
pkgdesc='All-purpose web-development environment based on Docker and Docker Compose.'
arch=('any')
url='https://docksal.io/'
license=('MIT')
depends=('docker' 'docker-compose' )
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('845126be72277c29d419016e3531ac8401fea55c00da220aefa5068880a1eb7a65250388e40f08d5c83c0adba0c4a08f0e3bd33f8da4c1e21cea972e39dd2da0')

package() {
  install -D "$srcdir/$pkgname-$pkgver/bin/fin" \
    "$pkgdir/usr/bin/fin"
}
