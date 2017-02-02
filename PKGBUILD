# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=sharefonts
pkgver=0.10
pkgrel=1
pkgdesc='A set of free Type1 fonts'
arch=('any')
url='http://www.gimp.org/'
license=('custom')
makedepends=('fontconfig' 'xorg-font-utils')
source=("https://download.gimp.org/pub/gimp/fonts/${pkgname}-${pkgver}.tar.gz")
sha256sums=('43bd85e7ac05a2e3fc496e6c5a3954f023a6602c13332625e07b7d26ad36b1e5')

package() {
	cd ${srcdir}/sharefont

	install -d ${pkgdir}/usr/share/fonts/sharefonts
	install -d ${pkgdir}/usr/share/licenses/sharefonts

	install -m0644 *.pfb ${pkgdir}/usr/share/fonts/sharefonts/
	install -m0644 README *.shareware ${pkgdir}/usr/share/licenses/sharefonts/
}

