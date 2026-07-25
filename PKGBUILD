# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
pkgname=decaf
pkgver=1.0.5
pkgrel=1
pkgdesc="A Rofi-based sleep timer utility"
arch=('any')
url="https://github.com/davi-s/decaf"
license=('MIT')
depends=('bash' 'systemd' 'rofi' 'libnotify')
# This downloads the source code directly from your GitHub release
source=("$pkgname-$pkgver.tar.gz::https://github.com/davi-s/decaf/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('26238ebae2ca99ac2129e1c9865dca787bed3f88c2e0bfc9f85caf6c2c36f1ee')

package() {
    cd "$pkgname-$pkgver"

    # Install the script directly to /usr/bin
    install -Dm755 src/decaf "$pkgdir/usr/bin/decaf"
}
