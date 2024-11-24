# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=pica-comic-bin
pkgdesc="A comic app"
pkgver=4.2.0
pkgrel=1
arch=('x86_64')
url="https://github.com/Pacalini/PicaComic"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
source=("https://github.com/Pacalini/PicaComic/releases/download/v${pkgver}/PicaComic-${pkgver}-amd64.deb")
sha256sums=('ff7c2552045539d26493406820748de4ecd832e8d1145c12f51b8de4174eb6ca')

package() {
    tar -I zstd -xf data.tar.zst -C "${pkgdir}/"
    chown -R root:root "${pkgdir}"
}
