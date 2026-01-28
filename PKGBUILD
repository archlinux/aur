# Maintainer: wedow <wedow@users.noreply.github.com>
pkgname=ticket
pkgver=0.3.1
pkgrel=1
pkgdesc="Minimal ticket tracking in bash"
arch=('any')
url="https://github.com/wedow/ticket"
license=('MIT')
depends=('bash' 'coreutils' 'findutils' 'gawk')
optdepends=('ripgrep: faster searching' 'jq: query command')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wedow/ticket/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee6dd094e262d8f02e451847249f0c3b665b92ab8e2317c9424553fc1f046d9e')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 ticket "$pkgdir/usr/bin/tk"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
