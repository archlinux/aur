# Maintainer: Bram <bram+sway@pescheck.io>
pkgname=sway-displays
pkgver=1.0.0
pkgrel=1
pkgdesc="Display manager for Sway window manager"
arch=('any')
url="https://github.com/pescheckit/sway-displays"
license=('MIT')
depends=('bash' 'jq' 'bc' 'sway')
optdepends=('sway-mirror: for display mirroring support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pescheckit/sway-displays/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 sway-displays "$pkgdir/usr/bin/sway-displays"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
