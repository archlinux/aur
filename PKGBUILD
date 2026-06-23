# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
pkgname=hyprdecaffeine
pkgver=1.0.0
pkgrel=1
pkgdesc="A Rofi-based sleep timer utility for Wayland/Hyprland"
arch=('any')
url="https://github.com/davi-s/hyprdecaffeine"
license=('MIT')
depends=('bash' 'systemd' 'rofi' 'libnotify')
# This downloads the source code directly from your GitHub release
source=("$pkgname-$pkgver.tar.gz::https://github.com/davi-s/hyprdecaffeine/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2d899033f4849096f671eb565a0e4e693c070446ac920658927ff175bedc03f1')

package() {
    cd "$pkgname-$pkgver"

    # Install the script directly to /usr/bin
    install -Dm755 src/hyprdecaffeine "$pkgdir/usr/bin/hyprdecaffeine"
}
