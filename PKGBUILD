# Maintainer: mellen <mellen@heatsync.org>
pkgname=cmdchamp
pkgver=1.0.6
pkgrel=1
pkgdesc='CLI command trainer with spaced repetition, boss fights, and sandbox execution'
arch=('any')
url='https://github.com/mellen9999/cmdchamp'
license=('MIT')
depends=('bash' 'bubblewrap')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a068d563fd90e0884b59cc1a30cac9747173a0bc6691c9e34d2227f465ecdf81')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 cmdchamp "$pkgdir/usr/bin/cmdchamp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
