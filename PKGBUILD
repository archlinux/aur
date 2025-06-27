# Maintainer: lumetas
pkgname=lstart
pkgver=1.0
pkgrel=1
pkgdesc="Utility to restart anything by monitoring directory changes"
arch=('any')
url="https://github.com/lumetas/lstart"
license=('MIT')
depends=('bash')
makedepends=('git')
source=("lstart")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/lstart" "$pkgdir/usr/bin/lstart"
}
