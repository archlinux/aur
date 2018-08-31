# Maintainer: Chanz Holopainen <chan at elakiri dot com>

pkgname=ttf-iskpota
pkgver=1
pkgrel=1
pkgdesc="Unicode sinhala font iskoola pota"
arch=('any')
url="https://www.np.gov.lk"
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=(https://www.np.gov.lk/iskpota.ttf)
md5sums=('eead4a342b44623239b39790a0cc88d2')

package() {
	mkdir -p "${pkgdir}/usr/share/fonts/TTF"
	cp "${srcdir}/iskpota.ttf" "${pkgdir}/usr/share/fonts/TTF/iskpota.ttf"
}
