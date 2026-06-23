# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
pkgname=decaf
pkgver=1.0.3
pkgrel=1
pkgdesc="A Rofi-based sleep timer utility"
arch=('any')
url="https://github.com/davi-s/decaf"
license=('MIT')
depends=('bash' 'systemd' 'rofi' 'libnotify')
# This downloads the source code directly from your GitHub release
source=("$pkgname-$pkgver.tar.gz::https://github.com/davi-s/decaf/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d98fa7cc270d2844ec85cf35dca32eb064ae751ca3e2f0fa1eaffb3525b9f995')

package() {
    cd "$pkgname-$pkgver"

    # Install the script directly to /usr/bin
    install -Dm755 src/decaf "$pkgdir/usr/bin/decaf"
}
