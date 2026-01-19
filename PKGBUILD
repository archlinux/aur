# Maintainer: wedow <wedow@users.noreply.github.com>
pkgname=ticket
pkgver=0.3.0
pkgrel=1
pkgdesc="Minimal ticket tracking in bash"
arch=('any')
url="https://github.com/wedow/ticket"
license=('MIT')
depends=('bash' 'coreutils' 'findutils' 'gawk')
optdepends=('ripgrep: faster searching' 'jq: query command')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wedow/ticket/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('63f8591a432d65ef87843fcd5e720a397865534bdbdc8d6724e8f70ce681a63b')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 ticket "$pkgdir/usr/bin/tk"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
