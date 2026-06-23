# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
pkgname=hyprdecaffeine
pkgver=1.0.1
pkgrel=1
pkgdesc="A Rofi-based sleep timer utility for Wayland/Hyprland"
arch=('any')
url="https://github.com/davi-s/hyprdecaffeine"
license=('MIT')
depends=('bash' 'systemd' 'rofi' 'libnotify')
# This downloads the source code directly from your GitHub release
source=("$pkgname-$pkgver.tar.gz::https://github.com/davi-s/hyprdecaffeine/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('10236f792e78d0a95e82bde8473fdb033dc5adfde8421ca86263de90f97c4d5c')

package() {
    cd "$pkgname-$pkgver"

    # Install the script directly to /usr/bin
    install -Dm755 src/hyprdecaffeine "$pkgdir/usr/bin/hyprdecaffeine"
}
