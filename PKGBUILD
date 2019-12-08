# Maintanier: graysky <graysky AT archlinux dot us>
pkgname=kodi-logger
pkgver=1.7
pkgrel=1
pkgdesc='Keeps track of every video you watch on kodi.'
arch=('any')
license=('MIT')
url="https://github.com/graysky2/kodi-logger"
depends=('diffutils')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0fb7cab759fd72c03dc541d02119abb9a61ca2465b69401e0165e4f4b01eb5d3')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 kodi18-logger.sh "$pkgdir/usr/bin/kodi18-logger"
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
