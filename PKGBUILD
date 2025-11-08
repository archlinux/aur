# Maintainer: dexield dexield.community@gmail.com
pkgname=fractal-forest
pkgver=0.1.0
pkgrel=1
pkgdesc="Real-time 3D fractal forest visualization in terminal"
arch=('x86_64')
url="https://github.com/dexield/fractal-forest"
license=('MIT')
depends=('glibc')
source=("fractal-forest-$pkgver-x86_64.tar.gz::http://dexieldvpn.ddns.net/fractal-forest-$pkgver-x86_64.tar.gz")
sha256sums=('5f48a6340f9c0a2c5eaa2b7962e71064d6ea93d1f1b2f46b400bc472737f86f3')

package() {
  cd "$srcdir"
  install -Dm755 "fractal-forest" "$pkgdir/usr/bin/fractal-forest"
}
