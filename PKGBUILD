# Maintainer: dexield
pkgname=fractal-forest
pkgver=0.1.0
pkgrel=1
pkgdesc="Real-time 3D fractal forest visualization in terminal"
arch=('x86_64')
url="https://github.com/dexield/fractal-forest"
license=('MIT')
depends=('glibc')
source=("fractal-forest-bin-$pkgver-x86_64.tar.gz::http://dexieldvpn.ddns.net/fractal-forest-bin-$pkgver-x86_64.tar.gz")
sha256sums=('a6ab2bb166b1da40d3e44457635dfb44e9fb392b92c8535e1d5a2415815cb46b')

package() {
  cd "$srcdir"
  install -Dm755 "fractal-forest" "$pkgdir/usr/bin/fractal-forest"
}
