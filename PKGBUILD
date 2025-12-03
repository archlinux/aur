# Maintainer: Your Name <your-email@example.com>
pkgname=lol-lint
pkgver=0.1.1
pkgrel=1
pkgdesc="A strict linter for LOLCODE that validates syntax and semantics"
arch=('x86_64')
url="https://github.com/jerankda/lol-lint"
license=('MIT')
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/jerankda/$pkgname/releases/download/v$pkgver/$pkgname-linux-$arch.tar.gz")
sha256sums=('7ecf3edb0201be32d0b32b02e22b9ad9fa09216116370f740ac4e8eb558462b3')

package() {
    install -Dm755 "$srcdir/lol-lint" "$pkgdir/usr/bin/lol-lint"
}
