# Maintainer: Your Name <macx cool at tutanota dot com>
pkgname=xml2abc
pkgver=143
pkgrel=2
pkgdesc="Python utility that translates MusicXML into ABC+ notation"
arch=('any')
url="https://wim.vree.org/svgParse/xml2abc.html"
license=('unknown')
depends=('python')
source=("https://wim.vree.org/svgParse/${pkgname}.py-${pkgver}.zip"
		"xml2abc")
sha256sums=('14678a24b82200c3dda4342891f05ba0d700dc6930712e3c773ec03674650a24'
            'a7d043c0f692063a596b63b605be6e14afc28acfc5438135a11314d7df943cb6')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/${pkgname}_${pkgver}/xml2abc.py" "${pkgdir}/usr/bin"
	cp xml2abc "${pkgdir}/usr/bin"
	chmod +x "${pkgdir}/usr/bin/xml2abc"
}
