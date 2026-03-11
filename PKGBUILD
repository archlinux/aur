# Maintainer: mellen <mellen@heatsync.org>
pkgname=cmdchamp
pkgver=0.1
pkgrel=1
pkgdesc='CLI command trainer with spaced repetition, boss fights, and sandbox execution'
arch=('any')
url='https://github.com/mellen9999/cmdchamp'
license=('MIT')
depends=('bash' 'bubblewrap')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('add61f167ab1a377508223a7ba35f0ff007e56f7b859469454f94ea396d41e0b')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 cmdchamp "$pkgdir/usr/bin/cmdchamp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
