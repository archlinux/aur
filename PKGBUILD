# Maintainer: wedow <wedow@users.noreply.github.com>
pkgname=ticket
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimal ticket tracking in bash"
arch=('any')
url="https://github.com/wedow/ticket"
license=('MIT')
depends=('bash' 'coreutils' 'findutils' 'gawk')
optdepends=('ripgrep: faster searching' 'jq: query command')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wedow/ticket/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e57149196ba9fe23c277e8165a2410912e1c5408dd8659765e8827321471c944')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 ticket "$pkgdir/usr/bin/tk"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
