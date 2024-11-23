# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=pica-comic-bin
pkgdesc="A comic app"
pkgver=4.1.7
pkgrel=1
arch=('x86_64')
url="https://github.com/Pacalini/PicaComic"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
source=("https://github.com/Pacalini/PicaComic/releases/download/v$pkgver/PicaComic-$pkgver-amd64.deb")
sha256sums=('762c4bb7edf8bc1afe78862f2b01f3755bceca7224e704e34409c8bce1e167ac')

package() {
    tar -I zstd -xf data.tar.zst -C "${pkgdir}/"
    chown -R root:root "${pkgdir}"
}
