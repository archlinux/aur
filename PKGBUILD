# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='ttf-0xa000'
pkgdesc='Monospace font family turned into TrueType starting from bitmaps'
pkgver='20180529'
pkgrel='2'
url='http://pippin.gimp.org/0xA000'
arch=('any')
license=('custom:OFL')
source=("${url}/0xA000.zip")
sha512sums=('2d6deeda7e8285ef6e1406859ed96021aa6d9c5b23ce38c77b447ac9f63b04255682042f21d672550eac3545fabecac6bc55b6ce4e0d89d3e462f56cbb1ac1db')

package () {
	install -m 755 -d "${pkgdir}/usr/share/fonts/${pkgname}"
	install -m 644 -t "${pkgdir}/usr/share/fonts/${pkgname}" *.ttf
	install -m 644 -D LICENSE.OFL \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.OFL"
}
