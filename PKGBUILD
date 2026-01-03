# Maintainer: wedow <wedow@users.noreply.github.com>
pkgname=ticket
pkgver=0.1.1
pkgrel=1
pkgdesc="Minimal ticket tracking in bash"
arch=('any')
url="https://github.com/wedow/ticket"
license=('MIT')
depends=('bash' 'coreutils' 'findutils' 'gawk')
optdepends=('ripgrep: faster searching' 'jq: query command')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wedow/ticket/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a44db815a1e3dee21299f56d870280cd4c01d7c7990b14ab7b7d6a5ca8b603ef')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 ticket "$pkgdir/usr/bin/tk"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
