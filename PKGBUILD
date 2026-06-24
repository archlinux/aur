# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
pkgname=expresso
pkgver=1.0.0
pkgrel=1
pkgdesc="A Rofi-based system awake and sleep inhibition utility"
arch=('any')
url="https://github.com/davi-s/expresso"
license=('MIT')
depends=('bash' 'systemd' 'rofi' 'libnotify')
# This downloads the source code directly from your GitHub release
source=("$pkgname-$pkgver.tar.gz::https://github.com/davi-s/expresso/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ad505f0a02bd3cd5adc2bd6c593138010373ac527e2d92576c6dd5854936a3f3')

package() {
    cd "$pkgname-$pkgver"

    # Install the script directly to /usr/bin
    install -Dm755 src/expresso "$pkgdir/usr/bin/expresso"
}
