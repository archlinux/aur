# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

pkgname=ttf-fritz
_pkgname=fritz
pkgver=20150506
pkgrel=1
pkgdesc="Fritz TTF typeface"
arch=(any)
url="https://fontsup.com/family/fritz.html"
license=(custom)
source=("Fritz-Regular.ttf::https://fontsup.com/download/44741.html"
        "Fritz-Bold.ttf::https://fontsup.com/download/44737.html"
        "Fritz-Italic.ttf::https://fontsup.com/download/44755.html"
	"Fritz-Bold-Italic.ttf::https://fontsup.com/download/44754.html")
sha256sums=('ccde794adb7465cc6567bc055b4ba40afb9442a6dcbd23853f20940be562aa57'
            '9f045f1054a41a1dae0549ced0806f165d70fa5a3e17e1d125cc5f1efd4745f8'
            'd900e54dbee24298f73a6a861a3c197df7f7035a1370b313f5f26251cdc4500e'
            '69c9b8e188c7980aed2e06a38d229d25c1a5888571279f54e2e6be16172283cd')

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}"/usr/share/fonts/TTF/${_pkgname}
	install -m644 ./*.ttf "${pkgdir}"/usr/share/fonts/TTF/${_pkgname}

	# TODO find license
	# install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
