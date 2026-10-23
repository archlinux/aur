# Maintainer: frousties <frousties.snouf@gmail.com>
# Contributor: frousties <frousties.snouf@gmail.com>
_pkgname=furifont
pkgname=ttf-${_pkgname}-variable
pkgver=v0.6.2
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
sha256sums=('5cd36ebcd9e9562351e01a8f06c9a0cccd2df610181f4d3e7a22381b7879c323'
			'fd73120b5a040cfe5313dad5453026bd7adb88a86f54f7a83468f2bc895289ea'
			'cdcdd8755df054ed5bbb136c0b754cbbfd1a372b099c08bf55b364c4957b9fa4'
			'5fa534373326e40ac1b18bde9a56565fb2801dfedb1ddfa857a41376d4d48a1c'
			'fcac737e761ec63dbfbdce11030a1780161920d80315edba9c8beff1c2bac5a2')

package() {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}"    "../FurifontSansVF.ttf"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}"    "../FurifontSerifVF.ttf"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}"    "../FurifontSansRomajiVF.ttf"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}"    "../FurifontSerifRomajiVF.ttf"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "../OFL.txt"
}
