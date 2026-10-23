# Maintainer: frousties <frousties.snouf@gmail.com>
# Contributor: frousties <frousties.snouf@gmail.com>
_pkgname=furifont
pkgname=otf-${_pkgname}
pkgver=v0.6.2
pkgrel=1
pkgdesc="Japanese font that shows furigana on the font itself."
arch=('any')
url="https://github.com/antfu/${_pkgname}/releases/download/${pkgver}"
license=('MIT' 'OFL-1.1')
provides=("${pkgname}=${pkgver}")
provides=(${pkgname})
source=("${url}/FurifontSans-Regular.otf"
		"${url}/FurifontSerif-Regular.otf"
		"${url}/FurifontSansRomaji-Regular.otf"
		"${url}/FurifontSerifRomaji-Regular.otf"
		"${url}/OFL.txt")
sha256sums=('b30d7e2da4ecbb2e8a9c737f8ac45a0b4ae3fca1585e1b2590d073498ebceb56'
			'cbc907150ec01057991d34cfe9a47c26ff2521036c08048f0fdc6b5e1f068ac6'
			'705059476ce847c6f83cfe773248e3f63dcefecbeec9a9ad5fe445efffde1717'
			'c9b6dc316fe999783d6495083ab24d9a77303b04364235a582e492fa442ac28d'
			'fcac737e761ec63dbfbdce11030a1780161920d80315edba9c8beff1c2bac5a2')

package() {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}"    "../FurifontSans-Regular.otf"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}"    "../FurifontSerif-Regular.otf"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}"    "../FurifontSansRomaji-Regular.otf"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}"    "../FurifontSerifRomaji-Regular.otf"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "../OFL.txt"
}
