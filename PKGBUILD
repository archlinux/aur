# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=crux-toolkit-bin
pkgver=3.2.42ecf25
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
sha256sums_x86_64=('73a90ef68c12f014eaa2536d9fc7e3ff3c488b356ddd84ed45aac59840a35b69')
sha256sums_i686=('99da951df1cfa5018d60b977920208483954b84e206e675e9061aecbd29a95fe')

package() {
    install -D -t "${pkgdir}/usr/bin" "crux-3.2.Linux.${CARCH}/bin/crux" 
}

