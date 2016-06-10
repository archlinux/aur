# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=ttf-mononoki
pkgver=1.2
pkgrel=1
pkgdesc="Monospace font for programmers, successor of monoOne"
arch=('any')
url="https://madmalik.github.io/mononoki/"
license=('custom:OFL')
depends=('fontconfig')
source=("https://github.com/madmalik/mononoki/archive/$pkgver.tar.gz")
sha256sums=('189ff2a74cd37ae080c2ffc4529bdc1ba09125db217b8e70c193886fa6166d91')

package() {
  cd mononoki-$pkgver
  install -dm755 "$pkgdir/usr/share/fonts/ttf-mononoki"
  install -m644 -t "$pkgdir/usr/share/fonts/ttf-mononoki" export/webfont/*.ttf
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
