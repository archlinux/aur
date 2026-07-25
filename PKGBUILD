# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
pkgname=decaf
pkgver=1.0.4
pkgrel=1
pkgdesc="A Rofi-based sleep timer utility"
arch=('any')
url="https://github.com/davi-s/decaf"
license=('MIT')
depends=('bash' 'systemd' 'rofi' 'libnotify')
# This downloads the source code directly from your GitHub release
source=("$pkgname-$pkgver.tar.gz::https://github.com/davi-s/decaf/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cb9a0a32c2cf9b8fb7221958ae7eb2c8d79a614a78a2c667806a1c9a3098eb66')

package() {
    cd "$pkgname-$pkgver"

    # Install the script directly to /usr/bin
    install -Dm755 src/decaf "$pkgdir/usr/bin/decaf"
}
