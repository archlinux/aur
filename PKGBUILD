# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
pkgname=hyprdecaffeine
pkgver=1.0.2
pkgrel=1
pkgdesc="A Rofi-based sleep timer utility for Wayland/Hyprland"
arch=('any')
url="https://github.com/davi-s/hyprdecaffeine"
license=('MIT')
depends=('bash' 'systemd' 'rofi' 'libnotify')
# This downloads the source code directly from your GitHub release
source=("$pkgname-$pkgver.tar.gz::https://github.com/davi-s/hyprdecaffeine/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e7a730fd465205ff70156de34999a7bb5647ca55059d428fb5314bae738dd9f5')

package() {
    cd "$pkgname-$pkgver"

    # Install the script directly to /usr/bin
    install -Dm755 src/hyprdecaffeine "$pkgdir/usr/bin/hyprdecaffeine"
}
