# Maintainer: VerruckteFuchs <derverrucktefuchs@gmail.com>
pkgname=ttf-lazenby-computer
pkgrel=1
pkgver=1
pkgdesc="Lazenby Computer TTF font by Andrew Young, Disaster Fonts"
arch=('any')
url="http://disasterfonts.co.uk"
license=('CC BY-SA 4.0')
depends=('fontconfig' 'xorg-font-utils')
source=('http://disasterfonts.co.uk/dl/lazenbycomputer.zip')
md5sums=('da083557fe4ab421cdb5c336a4ad1c53')
package() {
	install -d "${pkgdir}/usr/share/fonts/ttf-lazenby-computer"
	install -m644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/ttf-lazenby-computer"
}

