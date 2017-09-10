# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

pkgname=fonts-fritz
_pkgname=fritz
pkgver=20150506
pkgrel=1
pkgdesc="Fritz TTF typefaces"
arch=(any)
url="https://fontsup.com/full-search/fritz.html"
license=(custom)
provides=(ttf-fritz ttf-fritz-quad ttf-fritz-quadrata)
conflicts=(ttf-fritz ttf-fritz-quad ttf-fritz-quadrata)
source=("Fritz-Regular.ttf::https://fontsup.com/download/44741.html"
        "Fritz-Bold.ttf::https://fontsup.com/download/44737.html"
        "Fritz-Italic.ttf::https://fontsup.com/download/44755.html"
	"Fritz-Bold-Italic.ttf::https://fontsup.com/download/44754.html"
	"Fritz-Quad-Regular.ttf::https://fontsup.com/download/44739.html"
        "Fritz-Quad-Bold.ttf::https://fontsup.com/download/44738.html"
	"Fritz-Quadrata-Regular.ttf::https://fontsup.com/download/44753.html"
        "Fritz-Quadrata-Bold.ttf::https://fontsup.com/download/44751.html"
        "Fritz-Quadrata-Italic.ttf::https://fontsup.com/download/44752.html"
	"Fritz-Quadrata-Bold-Italic.ttf::https://fontsup.com/download/44750.html"
	"Fritz-Quadrata-Lefty.ttf::https://fontsup.com/download/44756.html"
	"Fritz-Quadrata-Cyrillic.ttf::https://fontsup.com/download/44740.html")
sha256sums=('ccde794adb7465cc6567bc055b4ba40afb9442a6dcbd23853f20940be562aa57'
            '9f045f1054a41a1dae0549ced0806f165d70fa5a3e17e1d125cc5f1efd4745f8'
            'd900e54dbee24298f73a6a861a3c197df7f7035a1370b313f5f26251cdc4500e'
            '69c9b8e188c7980aed2e06a38d229d25c1a5888571279f54e2e6be16172283cd'
            '6cd4eec6deaeda61c034a19d9b75c924fa2349ccec2e9fd802900d4366ec97e6'
            '673adf158f886a3d110e78e6a31cec0f6e3b48d34b929ffabc9f205607c5a1ac'
            '0014005c7f771c9e011b656691c3c88138853e4186f8e335bef89deccdc99525'
            '6fcd5342f630ec1af5f79019b794e2869c5026e1a1ada63ced15a2dc72766dd8'
            '32c1140424460d001fed6e89825f5c831f520184baddfc30cb865d2f7fcb8f11'
            'd07ddd97e63db370c050ab15552809fd3d9940108e1e960d402366f1298cd827'
            '9a6423a7305130d6838408dcdf926f4c4377b9add8e7fd984cd27b7952c33f5a'
            'a82bbc54d67400673403a0153907e5d7ec76908a714e34813100486dfec1618e')

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}"/usr/share/fonts/TTF/${_pkgname}
	install -m644 ./*.ttf "${pkgdir}"/usr/share/fonts/TTF/${_pkgname}

	# TODO find license
	# install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
