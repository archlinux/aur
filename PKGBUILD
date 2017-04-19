# Maintanier: graysky <graysky AT archlinux dot us>
pkgname=kodi-logger
pkgver=1.4
pkgrel=1
pkgdesc='Keeps track of every video you watch on kodi.'
arch=('any')
license=('MIT')
url="https://github.com/graysky2/kodi-logger"
depends=('perl')
replaces=('xbmc-logger')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('a9034c40b40e61454aeabaec4af204ab1f65e25ed836fddd34a6fd1865c34a30')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname.pl "$pkgdir/usr/bin/$pkgname"
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
