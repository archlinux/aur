# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

pkgname=ttf-soutane
_pkgname=soutane
pkgver=20150509
pkgrel=1
pkgdesc="Soutane TTF typeface"
arch=(any)
url="http://www.911fonts.com/font/family/soutane"
license=(custom)
source=("Soutane-Regular.ttf::http://www.911fonts.com/fonts/font-download-file/8595"
        "Soutane-Bold.ttf::http://www.911fonts.com/fonts/font-download-file/8596"
        "Soutane-Italic.ttf::http://www.911fonts.com/fonts/font-download-file/8598"
	"Soutane-Bold-Italic.ttf::http://www.911fonts.com/fonts/font-download-file/8597")
sha256sums=('f8aeae94cb33a57a232e3c4a5e530d2173e6f0756663b9426a3de8b568d170f0'
            'e8c14b7eb0c59aa32b117803e23d7f2eac853d705acbf7a04a8683094fa55be1'
            '5127d8814e7ae3d0e93f28f3c5351afc7fcea2c902bec6de312e3928176352e1'
	    '2c1c51052c105257a3d3cc0ad1fe08136cc8bf2ddfbe89c911a3520e971bf633')

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}"/usr/share/fonts/TTF/${_pkgname}
	install -m644 ./*.ttf "${pkgdir}"/usr/share/fonts/TTF/${_pkgname}

	# TODO find license
	# install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
