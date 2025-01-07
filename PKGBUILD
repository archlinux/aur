# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=venera-bin
pkgdesc="A comic app"
pkgver=1.1.4
pkgrel=1
arch=('x86_64')
url="https://github.com/venera-app/venera"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1')
source=("https://github.com/venera-app/venera/releases/download/v${pkgver}/venera_${pkgver}_amd64.deb")
sha256sums=('f8a5016506d60d35fef94081459ca57c88fba17c08ae3383ed64f2e317bdf7a0')

package() {
    tar -I zstd -xf data.tar.zst -C "${pkgdir}/"
    chown -R root:root "${pkgdir}"
}
