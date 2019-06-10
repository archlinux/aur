# Maintainer: Zach Hoffman <zach@zrhoffman.net>

pkgname=docksal
pkgver=1.12.2
pkgrel=1
epoch=1
pkgdesc='All-purpose web-development environment based on Docker and Docker Compose.'
arch=('any')
url='https://docksal.io/'
license=('MIT')
depends=('docker' 'docker-compose' )
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('d4c3d554348599dd0fe1f209f17aeb028c3407e441f61617a6764c045b2c75335fb230ab42c9e86f2a738b2096cbecb9e13ba1c83af4904d920074910853b1a5')

package() {
  install -D "$srcdir/$pkgname-$pkgver/bin/fin" \
    "$pkgdir/usr/bin/fin"
}
