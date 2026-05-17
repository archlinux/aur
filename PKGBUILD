pkgname=lenovoctl
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight CLI tool to control Lenovo laptop features on Linux"
arch=('any')
url="https://github.com/ayanrajpoot10/lenovoctl"
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ayanrajpoot10/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5e9fd827d7515cc4d420c08fb21c965ada511c4de8b1ca3bcbc0edebf7120788')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 lenovoctl "$pkgdir/usr/bin/lenovoctl"

    install -Dm644 lenovoctl.1 \
        "$pkgdir/usr/share/man/man1/lenovoctl.1"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
