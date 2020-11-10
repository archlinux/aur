# Maintainer: Michael Szafranek <faule.aepfel@gmail.com>

pkgname=bobco-ttf
pkgver=1.0
pkgrel=1
pkgdesc='The true Subgenius symbol font iconography!! Dingbats'
url='http://www.subgenius.com/SUBFONTS/subfont.html'
license=('custom')
arch=('any')
source=("http://www.subgenius.com/SUBFONTS/BobCo10-Mac/BOBCO10.ttf.zip")
sha256sums=('98b6ff8275ae0cef9bed1b4edb88973e48b2cfbb5b891dcf9ab29fdbe61da2ab')

package() {
	cd "${srcdir}/"
	install -d "${pkgdir}"/usr/share/fonts/TTF
	install -m644 BOBCO10.ttf "${pkgdir}"/usr/share/fonts/TTF/BobCo10.ttf
	install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
