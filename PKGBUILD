# Maintainer: frousties <frousties.snouf@gmail.com>
# Contributor: frousties <frousties.snouf@gmail.com>
_pkgname=furifont
pkgname=ttf-${_pkgname}-variable
pkgver=v0.7.0
pkgrel=1
pkgdesc="Japanese font that shows furigana on the font itself."
arch=('any')
url="https://github.com/antfu/${_pkgname}/releases/download/${pkgver}"
license=('MIT' 'OFL-1.1')
provides=("${pkgname}=${pkgver}")
provides=(${pkgname})
source=("${url}/FurifontSansVF.ttf"
		"${url}/FurifontSerifVF.ttf"
		"${url}/FurifontSansRomajiVF.ttf"
		"${url}/FurifontSerifRomajiVF.ttf"
		"${url}/OFL.txt")
sha256sums=('141e54d8f23c55ad8c0cede8d4ac44cfc25c86f9784049418ef276aba32fd74a'
			'be69b38af8b568f44a2f77b66990f0c45854425f0129dce8686f921362c0fef4'
			'080122c2d78b17b865b418671925015e6f64d28e1ccc3b47a06a108cb085b4d3'
			'5f281e32faa7d71a345d5392e9933cd36b4f06024ba4f8e3f6389c18e6230a68'
			'fcac737e761ec63dbfbdce11030a1780161920d80315edba9c8beff1c2bac5a2')

package() {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}"    "../FurifontSansVF.ttf"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}"    "../FurifontSerifVF.ttf"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}"    "../FurifontSansRomajiVF.ttf"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}"    "../FurifontSerifRomajiVF.ttf"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "../OFL.txt"
}
