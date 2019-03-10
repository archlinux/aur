# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=crux-toolkit-bin
pkgver=3.2.85114c7
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
sha256sums_x86_64=('a77e23f33c221db8da29780d8d389d667e55f62055e234b55bae1a431c05d5ba')
sha256sums_i686=('3799c8f63292e0469303f5068d2ec24f420590fa65a7e7b2e37699259b13ae34')

package() {
    install -D -t "${pkgdir}/usr/bin" "crux-3.2.Linux.${CARCH}/bin/crux" 
}

