# Maintainer: spider-mario <spidermario@free.fr>
pkgname=qpsnr
pkgver=0.2.5
pkgrel=1
epoch=
pkgdesc="A quick PSNR/SSIM analyzer"
arch=('i686' 'x86_64')
url="http://qpsnr.youlink.org/"
license=('GPL3')
depends=('ffmpeg' 'gcc-libs')
source=(http://${pkgname}.youlink.org/data/${pkgname}_${pkgver}.tar.bz2)
sha512sums=('d56b442479a659ab849eab008c969106450c65203c564513fc59982b0ea9081ab204d630c850b00bb0bdd50b4c19ab560176ac213ab850d4e2984f73c23d16a7')

build() {
	make
}

package() {
	install --directory "$pkgdir"/usr/bin/
	install qpsnr "$pkgdir"/usr/bin/
}
