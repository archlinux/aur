# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Zach Hoffman <zach@zrhoffman.net>

pkgname=docksal
pkgver=1.13.1
pkgrel=1
pkgdesc='Docker powered environments for web development on macOS, Windows and Linux'
arch=('any')
url='https://docksal.io/'
license=('MIT')
depends=('docker' 'docker-compose' )
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('c2b702dc1661a8cfbc6de648d38e01c0c40d5f26571442db25a7c8b7e50b7f11270180507e50fc307f975c50a1f58a40658f1733121b2d22359c74c07ec9dbd1')

package() {
  install -D "$srcdir/$pkgname-$pkgver/bin/fin" \
    "$pkgdir/usr/bin/fin"
}