# Maintainer: Zach Hoffman <zach@zrhoffman.net>

pkgname=docksal
pkgver=1.12.1
pkgrel=1
epoch=1
pkgdesc='All-purpose web-development environment based on Docker and Docker Compose.'
arch=('any')
url='https://docksal.io/'
license=('MIT')
depends=('docker' 'docker-compose' )
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('4a852d934f8363693a058ef4b984f1a02351062e463b870701108a4fde511bafc1a494646010e8749475f36635c90bb86c82da649a59987247729141f3458abf')

package() {
  install -D "$srcdir/$pkgname-$pkgver/bin/fin" \
    "$pkgdir/usr/bin/fin"
}
