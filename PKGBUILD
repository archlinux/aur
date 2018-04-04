# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=crux-toolkit-bin
pkgver=3.1.f2e7488
pkgrel=1
pkgdesc="A mass spectrometry analysis toolkit"
arch=('x86_64' 'i686')
url="http://crux.ms"
license=('Apache')
depends_x86_64=('gcc-libs')
depends_i686=('lib32-gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}-git")
source=("https://noble.gs.washington.edu/crux-downloads/daily/crux-${pkgver}.Linux.${CARCH}.zip")
noextract=()
if [ "$CARCH" == 'i686' ]; then
    md5sums=('a483e0a2a9dd9761337a9b58d9204857')
else
    md5sums=('71ccc7ec46c330a02fffd07a7f1b0136')
fi

package() {
    install -D -t "${pkgdir}/usr/bin" "crux-3.1.Linux.${CARCH}/bin/crux" 
}

