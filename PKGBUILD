# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
pkgname=expresso
pkgver=1.0.1
pkgrel=1
pkgdesc="A Rofi-based system awake and sleep inhibition utility"
arch=('any')
url="https://github.com/davi-s/expresso"
license=('MIT')
depends=('bash' 'systemd' 'rofi' 'libnotify')
# This downloads the source code directly from your GitHub release
source=("$pkgname-$pkgver.tar.gz::https://github.com/davi-s/expresso/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c8d3295b66d33acdd2168435ecbb55e479e041a6f53f084c97dc6fe1a801ddd1')

package() {
    cd "$pkgname-$pkgver"

    # Install the script directly to /usr/bin
    install -Dm755 src/expresso "$pkgdir/usr/bin/expresso"
}
