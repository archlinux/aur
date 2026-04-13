# Maintainer: shbernal <shbernal.01@gmail.com>
pkgname=och
pkgver=0.1.0
pkgrel=1
pkgdesc='Helper script for some OpenClaw TUI gaps'
arch=('any')
url='https://github.com/shbernal/och'
license=('MIT')
depends=('bash' 'jq' 'moreutils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d8ffc0a8e171b1c8ce42a76ad9e55cc146fff1afd4bb368e531313167e049674')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 och "$pkgdir/usr/bin/och"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
