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
sha256sums=('00f621b3aa17daff042a822aafbd3ed1d374c461bc454e439c20386218947315')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 cmdchamp "$pkgdir/usr/bin/cmdchamp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
