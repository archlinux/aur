# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=freefonts
pkgver=0.10
pkgrel=4
pkgdesc='A set of free Type1 fonts'
arch=('any')
url='http://www.gimp.org/'
license=('custom')
makedepends=('fontconfig' 'xorg-font-utils')
source=("https://download.gimp.org/pub/gimp/fonts/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1babf159f79221c2fd6778d49b4740907e63bd4febeeac0a597760d2b5d71608')

package() {
	cd ${srcdir}/freefont

	install -d ${pkgdir}/usr/share/fonts/freefonts
	install -d ${pkgdir}/usr/share/licenses/freefonts

	install -m0644 *.pfb ${pkgdir}/usr/share/fonts/freefonts/
	install -m0644 *.license ${pkgdir}/usr/share/licenses/freefonts/
}

