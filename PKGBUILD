# Maintainer: Marko Zivic <marko.b.zivic@gmail.com>
pkgname=spectroterm
pkgver=0.4.7
pkgrel=1
pkgdesc="Curses based terminal spectrum analyzer for currently playing audio"
arch=('any')
url="https://github.com/mzivic7/$pkgname"
license=('GPL')
depends=()
provides=('spectroterm')
conflicts=('spectroterm')
makedepends=()
source=("$pkgname.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver-linux.tar.gz")
sha256sums=('SKIP')
options=(!strip)

package() {
  install -Dm755 "spectroterm" "$pkgdir/usr/bin/spectroterm"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
