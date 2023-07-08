# Maintainer: Your Name <macx cool at tutanota dot com>
pkgname=xml2abc
pkgver=145
pkgrel=1
pkgdesc="Python utility that translates MusicXML into ABC+ notation"
arch=('any')
url="https://wim.vree.org/svgParse/xml2abc.html"
license=('unknown')
depends=('python')
source=("https://wim.vree.org/svgParse/${pkgname}.py-${pkgver}.zip"
		"xml2abc")
sha256sums=('d62af1295a2f75fbcd099c4811955fbcb62002328b4249b41e724e237650a719'
            'a7d043c0f692063a596b63b605be6e14afc28acfc5438135a11314d7df943cb6')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/${pkgname}_${pkgver}/xml2abc.py" "${pkgdir}/usr/bin"
	cp xml2abc "${pkgdir}/usr/bin"
	chmod +x "${pkgdir}/usr/bin/xml2abc"
}
