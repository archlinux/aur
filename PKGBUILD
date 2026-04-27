# Maintainer: dmnmsc
pkgname=kraiser
pkgver=1.3.1
pkgrel=1
pkgdesc="Run or raise apps on KDE Plasma Wayland using kdotool"
arch=('any')
url="https://github.com/dmnmsc/kraiser"
license=('GPL3')
depends=('bash' 'kdotool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('351e10cec67a38b8854016d21d7e5935eb05d6a6770c565d94373466eead5c9e')
install="$pkgname.install"

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/kraiser.sh" "$pkgdir/usr/bin/kraiser"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
