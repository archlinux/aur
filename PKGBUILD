# Maintanier: graysky <graysky AT archlinux dot us>
pkgname=kodi-logger
pkgver=1.8
pkgrel=1
pkgdesc='Keeps track of every video you watch on kodi.'
arch=('any')
license=('MIT')
url="https://github.com/graysky2/kodi-logger"
depends=('diffutils')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e6b4dc22526f742d2f141379e4744fe26e9561bc888ba3fd50a7ba17b49bbf8a')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 kodi18-logger.sh "$pkgdir/usr/bin/kodi18-logger"
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
