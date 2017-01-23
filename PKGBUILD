# Maintanier: graysky <graysky AT archlinux dot us>
pkgname=kodi-logger
pkgver=1.3
pkgrel=3
pkgdesc='Keeps track of every video you watch on kodi.'
arch=('any')
license=('MIT')
url="https://github.com/graysky2/kodi-logger"
depends=('perl')
replaces=('xbmc-logger')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('ed3e30621966e521614309e20837c076bba8ca22d208a4ff5b60fd99a47d9441')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname.pl "$pkgdir/usr/bin/$pkgname"
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
