# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=venera-bin
pkgdesc="A comic app"
pkgver=1.1.2
pkgrel=1
arch=('x86_64')
url="https://github.com/venera-app/venera"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
source=("https://github.com/venera-app/venera/releases/download/v${pkgver}/venera_${pkgver}_amd64.deb")
sha256sums=('41b9e38a0a38b85f3a1e7fee6fcbffffe44ecfb5fcf9d820fe320d1b22806240')

package() {
    tar -I zstd -xf data.tar.zst -C "${pkgdir}/"
    chown -R root:root "${pkgdir}"
}
