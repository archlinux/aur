# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=crux-toolkit-bin
pkgver=3.1
pkgrel=1
pkgdesc="A mass spectrometry analysis toolkit"
arch=('x86_64' 'i686')
url="http://crux.ms"
license=('Apache')
depends=('gcc-libs')
provides=('crux-toolkit')
source=("https://noble.gs.washington.edu/crux-downloads/crux-${pkgver}/crux-${pkgver}.Linux.${CARCH}.zip")
noextract=()
if [ "$CARCH" == 'i686' ]; then
    md5sums=('7eae99e4d5c8fcd47916689622864dd4')
else
    md5sums=('0b2f29d9d41b64f8b5cd38bee3369666')
fi

package() {
    install -D -t "${pkgdir}/usr/bin" "crux-${pkgver}.Linux.${CARCH}/bin/crux" 
}

