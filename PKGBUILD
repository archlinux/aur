# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=crux-toolkit-bin
pkgver=3.1.a892254
pkgrel=2
pkgdesc="A mass spectrometry analysis toolkit"
arch=('x86_64' 'i686')
url="http://crux.ms"
license=('Apache')
depends=('gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}-git")
source=("https://noble.gs.washington.edu/crux-downloads/daily/crux-${pkgver}.Linux.${CARCH}.zip")
noextract=()
if [ "$CARCH" == 'i686' ]; then
    md5sums=('507e33a0bcfb62799b038bb47ceef711')
else
    md5sums=('9df645ddfa56b18cf5322fb3b5185dea')
fi

package() {
    install -D -t "${pkgdir}/usr/bin" "crux-3.1.Linux.${CARCH}/bin/crux" 
}

