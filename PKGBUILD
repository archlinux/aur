# Maintainer: dmnmsc
pkgname=kraiser
pkgver=1.3
pkgrel=1
pkgdesc="Run or raise apps on KDE Plasma Wayland using kdotool"
arch=('any')
url="https://github.com/dmnmsc/kraiser"
license=('GPL3')
depends=('bash' 'kdotool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4d3c086d26b1fa65e4f1312ee15c9821774e7dc3000d3a51e2a118b2ee15753c')
install="$pkgname.install"

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/kraiser.sh" "$pkgdir/usr/bin/kraiser"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
