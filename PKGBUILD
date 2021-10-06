# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=crux-toolkit-bin
pkgver=4.0.ad795d6
pkgrel=1
pkgdesc="A mass spectrometry analysis toolkit"
arch=('x86_64' 'i686')
url="http://crux.ms"
license=('Apache')
depends_x86_64=('gcc-libs')
depends_i686=('lib32-gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}-git")
source_x86_64=("https://noble.gs.washington.edu/crux-downloads/daily/crux-${pkgver}.Linux.${CARCH}.zip")
source_i686=("https://noble.gs.washington.edu/crux-downloads/daily/crux-${pkgver}.Linux.${CARCH}.zip")
sha256sums_x86_64=('1e02afd2992373dde49e0dc03f1b0c2ea8819d402ade7c5c578871c3cfc5c2df')
sha256sums_i686=('4185450c8c77f3e27a5f98d3b5b911bf2331d86af9bc62e94e0dd6b2d73419ff')

package() {
    install -D -t "${pkgdir}/usr/bin" "crux-4.0.Linux.${CARCH}/bin/crux" 
}

