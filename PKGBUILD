# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=pica-comic-bin
pkgdesc="A comic app"
pkgver=4.2.1
pkgrel=1
arch=('x86_64')
url="https://github.com/Pacalini/PicaComic"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
source=("https://github.com/Pacalini/PicaComic/releases/download/v${pkgver}/PicaComic-${pkgver}-amd64.deb")
sha256sums=('aea065856ad1e6a32871f4b92e886e7bdc112546730fb93c8fac8ca84d3c2d95')

package() {
    tar -I zstd -xf data.tar.zst -C "${pkgdir}/"
    chown -R root:root "${pkgdir}"
}
