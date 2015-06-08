# Maintanier: graysky <graysky AT archlinux dot us>
pkgname=kodi-logger
pkgver=1.3
pkgrel=2
pkgdesc='Keeps track of every video you watch on kodi.'
arch=('any')
license=('MIT')
url="https://github.com/graysky2/kodi-logger"
depends=('perl')
replaces=('xbmc-logger')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('4142be194eccdf284962bc4a8874488ae1a5af056c1c55cbdd820b390ae92d64')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname.pl "$pkgdir/usr/bin/$pkgname"
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
