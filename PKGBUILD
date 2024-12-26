# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=venera-bin
pkgdesc="A comic app"
pkgver=1.1.3
pkgrel=1
arch=('x86_64')
url="https://github.com/venera-app/venera"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1')
source=("https://github.com/venera-app/venera/releases/download/v${pkgver}/venera_${pkgver}_amd64.deb")
sha256sums=('27b74b7319eb13f03525d5e3d3bb06c86525da0bd0d4564752ce899f25b4f52f')

package() {
    tar -I zstd -xf data.tar.zst -C "${pkgdir}/"
    chown -R root:root "${pkgdir}"
}
