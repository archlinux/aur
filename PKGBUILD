# Maintainer: mellen <mellen@heatsync.org>
pkgname=cmdchamp
pkgver=1.0.3
pkgrel=1
pkgdesc='CLI command trainer with spaced repetition, boss fights, and sandbox execution'
arch=('any')
url='https://github.com/mellen9999/cmdchamp'
license=('MIT')
depends=('bash' 'bubblewrap')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3e3dbf37fa6341dab09c369bb3fc88715fe257104f580c86c30bdd2dbd003318')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 cmdchamp "$pkgdir/usr/bin/cmdchamp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
