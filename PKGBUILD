# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=crux-toolkit-bin
pkgver=4.0.6818dcc
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
sha256sums_x86_64=('7b0190bff4acac1343d7ec71fab34c1fe831cc814d50472e6278954af9b4061f')
sha256sums_i686=('81611edd1c711e96bbc5360d258ca0556e73f8dcb085fe0a0cb08fc56f9c0113')

package() {
    install -D -t "${pkgdir}/usr/bin" "crux-4.0.Linux.${CARCH}/bin/crux" 
}

