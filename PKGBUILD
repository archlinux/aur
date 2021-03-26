# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=crux-toolkit-bin
pkgver=3.2.6da2a98
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
sha256sums_x86_64=('faf5f863a0ea1d1fea8cc5e4bbbc86934badafcac4f517cbfb645dfa02df0738')
sha256sums_i686=('a7263a2741bca3d43536ecf5d87ef156fc2882f00af04ac60be27bbb3754eb00')

package() {
    install -D -t "${pkgdir}/usr/bin" "crux-3.2.Linux.${CARCH}/bin/crux" 
}

