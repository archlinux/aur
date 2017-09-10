# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

pkgname=fonts-soutane
_pkgname=soutane
pkgver=20150509
pkgrel=1
pkgdesc="Soutane TTF typefaces"
arch=(any)
url="https://fontsup.com/full-search/soutane.html"
license=(custom)
provides=(ttf-soutane ttf-soutane-black ttf-soutane-extrabold)
conflicts=(ttf-soutane ttf-soutane-black ttf-soutane-extrabold)
source=("Soutane-Regular.ttf::https://fontsup.com/download/96712.html"
        "Soutane-Bold.ttf::https://fontsup.com/download/96708.html"
        "Soutane-Italic.ttf::https://fontsup.com/download/96711.html"
	"Soutane-Bold-Italic.ttf::https://fontsup.com/download/96707.html"
	"Soutane-Black-Regular.ttf::https://fontsup.com/download/96713.html"
	"Soutane-ExtraBold-Regular.ttf::https://fontsup.com/download/96714.html"
	"Soutane-ExtraBold-Italic.ttf::https://fontsup.com/download/96715.html")
sha256sums=('f8aeae94cb33a57a232e3c4a5e530d2173e6f0756663b9426a3de8b568d170f0'
            'e8c14b7eb0c59aa32b117803e23d7f2eac853d705acbf7a04a8683094fa55be1'
            '5127d8814e7ae3d0e93f28f3c5351afc7fcea2c902bec6de312e3928176352e1'
            '2c1c51052c105257a3d3cc0ad1fe08136cc8bf2ddfbe89c911a3520e971bf633'
            'fc0f2e8c6ab17f510dcab260c2b8af041743646cb87689f155ff88222222ea38'
            '690a3302ffc6f7769a812ec05de3944bdfa2f18d1094f6a708c4337b98e793dd'
	    '5e2215c551a9fbcd011505ba2f91f21d079bc1b8bf9dd8e9206b73f5725a3c24')

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}"/usr/share/fonts/TTF/${_pkgname}
	install -m644 ./*.ttf "${pkgdir}"/usr/share/fonts/TTF/${_pkgname}

	# TODO find license
	# install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
