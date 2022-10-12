pkgname=ttf-mononoki
pkgver=1.4
pkgrel=1
pkgdesc="Monospace font for programmers, successor of monoOne"
arch=('any')
url="https://madmalik.github.io/mononoki/"
license=('custom:OFL')
depends=('fontconfig')
source=("https://github.com/madmalik/mononoki/archive/$pkgver.tar.gz")
sha256sums=('8d8fc4713f327a66482a030cf7bf18ec36b85afc24c7863ddaee7d18996eba7a')

package() {
  cd mononoki-$pkgver
  install -dm755 "$pkgdir/usr/share/fonts/ttf-mononoki"
  install -m644 -t "$pkgdir/usr/share/fonts/ttf-mononoki" export/*.ttf
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
