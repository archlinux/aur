# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=crux-toolkit-bin
pkgver=3.2.dcf56a2
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
sha256sums_x86_64=('365244061bfa045f35e4343be7e877788e7068cc030c21f571ec947a216b0b4c')
sha256sums_i686=('8c8bbce252d0feb0559673f4397b962afd3aa962cb9e91d98574cf12cf799cd1')

package() {
    install -D -t "${pkgdir}/usr/bin" "crux-3.2.Linux.${CARCH}/bin/crux" 
}

