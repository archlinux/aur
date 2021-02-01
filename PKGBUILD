pkgname=ttf-mononoki
pkgver=1.3
pkgrel=1
pkgdesc="Monospace font for programmers, successor of monoOne"
arch=('any')
url="https://madmalik.github.io/mononoki/"
license=('custom:OFL')
depends=('fontconfig')
source=("https://github.com/madmalik/mononoki/archive/$pkgver.tar.gz")
sha256sums=('2fc0ba8424abe52b7adcaa20fce65a9f6f5427b0568c04711f68d5e7ca8d78d1')

package() {
  cd mononoki-$pkgver
  install -dm755 "$pkgdir/usr/share/fonts/ttf-mononoki"
  install -m644 -t "$pkgdir/usr/share/fonts/ttf-mononoki" export/*.ttf
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
