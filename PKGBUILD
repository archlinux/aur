# Maintainer: wedow <wedow@users.noreply.github.com>
pkgname=ticket
pkgver=0.3.2
pkgrel=1
pkgdesc="Minimal ticket tracking in bash"
arch=('any')
url="https://github.com/wedow/ticket"
license=('MIT')
depends=('bash' 'coreutils' 'findutils' 'gawk')
optdepends=('ripgrep: faster searching' 'jq: query command')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wedow/ticket/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5d4c82ed1c5cb4a2aeb63b47c3c8931738c3287e555f43bf831d3d323687db0f')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 ticket "$pkgdir/usr/bin/tk"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
