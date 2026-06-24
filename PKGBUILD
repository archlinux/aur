# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
pkgname=expresso
pkgver=1.0.2
pkgrel=2
pkgdesc="A Rofi-based system awake and sleep inhibition utility"
arch=('any')
url="https://github.com/davi-s/expresso"
license=('MIT')
depends=('bash' 'systemd' 'rofi' 'libnotify' 'wayland-idle-inhibitor-git')
# This downloads the source code directly from your GitHub release
source=("$pkgname-$pkgver.tar.gz::https://github.com/davi-s/expresso/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('696292e422c85d4955e1fc9e0412ec3d929719d3cd410c0e3e8a629d6e8f1b07')

package() {
    cd "$pkgname-$pkgver"

    # Install the script directly to /usr/bin
    install -Dm755 src/expresso "$pkgdir/usr/bin/expresso"
}
