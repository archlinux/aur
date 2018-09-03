# Maintanier: graysky <graysky AT archlinux dot us>
pkgname=kodi-logger
pkgver=1.5
pkgrel=1
pkgdesc='Keeps track of every video you watch on kodi.'
arch=('any')
license=('MIT')
url="https://github.com/graysky2/kodi-logger"
depends=('perl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d3725f814fb6233c8ad31e8cf3bf466676f22ce480d22aa431e2e59510ee5df2')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 kodi17-logger.pl "$pkgdir/usr/bin/kodi17-logger"
  install -Dm755 kodi18-logger.pl "$pkgdir/usr/bin/kodi18-logger"
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
