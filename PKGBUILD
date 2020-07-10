# Maintainer: Chris Chamberlain <chris@chamberlain.id.au>

pkgname=ttf-line-awesome
pkgver=1.2.1
pkgrel=1
pkgdesc="Line Awesome is a free alternative for Font Awesome 5.11.2."
url="https://github.com/icons8/line-awesome"
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/icons8/line-awesome/archive/v$pkgver.tar.gz")

package_ttf-line-awesome() {
  cd "line-awesome-${pkgver}"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 dist/line-awesome/fonts/*.ttf "$pkgdir/usr/share/fonts/TTF"
}

md5sums=('31367d97c215fba27eb79342af12e902')
