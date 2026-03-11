# Maintainer: mellen <mellen@heatsync.org>
pkgname=cmdchamp
pkgver=1.0
pkgrel=1
pkgdesc='CLI command trainer with spaced repetition, boss fights, and sandbox execution'
arch=('any')
url='https://github.com/mellen9999/cmdchamp'
license=('MIT')
depends=('bash' 'bubblewrap')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c8a883546793f637bbc23327ca4b424d5ccfcc6e7f4fb2bbed22c9acd08fb41b')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 cmdchamp "$pkgdir/usr/bin/cmdchamp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
