# Maintainer: Bram <bram+sway@pescheck.io>
pkgname=sway-displays
pkgver=1.0.6
pkgrel=1
pkgdesc="Display manager for Sway window manager"
arch=('any')
url="https://github.com/pescheckit/sway-displays"
license=('MIT')
depends=('bash' 'jq' 'bc' 'sway')
optdepends=('sway-mirror: for display mirroring support')
source=("sway-displays-1.0.6.tar.gz::https://github.com/pescheckit/sway-displays/archive/refs/tags/v1.0.6.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 sway-displays "$pkgdir/usr/bin/sway-displays"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
