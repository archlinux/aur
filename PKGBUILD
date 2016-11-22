# Maintainer: spider-mario <spidermario@free.fr>
pkgname=qpsnr
pkgver=0.2.5
pkgrel=2
epoch=
pkgdesc="A quick PSNR/SSIM analyzer"
arch=('i686' 'x86_64')
url="https://github.com/FallingSnow/qpsnr"
license=('GPL3')
depends=('ffmpeg' 'gcc-libs')
source=(git+https://github.com/FallingSnow/qpsnr.git)
sha512sums=('SKIP')

build() {
    cd qpsnr
    make
}

package() {
    cd qpsnr
    install -D qpsnr "$pkgdir"/usr/bin/qpsnr
}
