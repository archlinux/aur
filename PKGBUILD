# Maintainer: frousties <frousties.snouf@gmail.com>
# Contributor: frousties <frousties.snouf@gmail.com>
_pkgname=furifont
pkgname=otf-${_pkgname}
pkgver=v0.7.0
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
sha256sums=('5d42132b053985817d07aadc099a7735a8836ad38907141be8709f27cae8e87e'
			'16916980b4fa036258076a851aba39f6531dce49fb3d2581b880be0f2b89dbe9'
			'5a4c0ec2e748e5ac2118680cc4b17f9c15a45b9e4473a8d8db66982d8a50883b'
			'90b7d7566c9f02f282deecdd0dd9b0c57486e3b9924c846215e95d6a64ab6ec6'
			'fcac737e761ec63dbfbdce11030a1780161920d80315edba9c8beff1c2bac5a2')

package() {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}"    "../FurifontSans-Regular.otf"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}"    "../FurifontSerif-Regular.otf"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}"    "../FurifontSansRomaji-Regular.otf"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}"    "../FurifontSerifRomaji-Regular.otf"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "../OFL.txt"
}
