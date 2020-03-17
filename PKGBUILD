# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Zach Hoffman <zach@zrhoffman.net>

pkgname=docksal
pkgver=1.13.2
pkgrel=1
pkgdesc='Docker powered environments for web development on macOS, Windows and Linux'
arch=('any')
url='https://docksal.io/'
license=('MIT')
depends=('docker' 'docker-compose' )
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('cb12ef4e430620b8f06aa1beb687564a')

package() {
  install -D "$srcdir/$pkgname-$pkgver/bin/fin" "$pkgdir/usr/bin/fin"
}