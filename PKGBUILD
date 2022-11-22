pkgname=ttf-mononoki
pkgver=1.5
pkgrel=1
pkgdesc="Monospace font for programmers, successor of monoOne"
arch=('any')
url="https://madmalik.github.io/mononoki/"
license=('custom:OFL')
depends=('fontconfig')
source=("https://github.com/madmalik/mononoki/archive/$pkgver.tar.gz")
sha256sums=('75071aa1baadc9a63d9808656eb3b525b7d777ad302e92cc28d2054b85a0e74d')

package() {
  cd mononoki-$pkgver
  install -dm755 "$pkgdir/usr/share/fonts/ttf-mononoki"
  install -m644 -t "$pkgdir/usr/share/fonts/ttf-mononoki" export/*.ttf
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
