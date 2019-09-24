# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=crux-toolkit-bin
pkgver=3.2.3ace861
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
sha256sums_x86_64=('e2bfb40a7bf581b53c45500e506741624a87f226c9034e0ec6e6dcafa761dd53')
sha256sums_i686=('e5dbb7f418ef285432a3821bf83c5a821f40be35629ae6c7c2a482671e9c9019')

package() {
    install -D -t "${pkgdir}/usr/bin" "crux-3.2.Linux.${CARCH}/bin/crux" 
}

