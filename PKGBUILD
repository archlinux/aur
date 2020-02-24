# Contributor: felix
# Contributor: Tushar R <echo dHVzaGFyXzcyN0B5YWhvby5jb20K | base64 -d>
# Contributor: Bernhard Tittelbach <xro -at- realraum -dot- at>
# Maintainer: Emil VATAI (vatai) <emil.vatai@gmail.com>

pkgname=ttf-kanjistrokeorders
pkgver=4.002
pkgrel=2
pkgdesc="Kanji stroke order font"
arch=('any')
license=('custom')
url="http://www.nihilist.org.uk/"
source=("https://www.dropbox.com/s/tnq52bz46n5zyh1/KanjiStrokeOrders_v${pkgver}.zip")
sha256sums=('66ef5987dd64474e6c638f020fdb6fbe10db4b58f1420e32b22b320d2407f5cb')


package() {
	cd "${srcdir}"

	install -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 "KanjiStrokeOrders_v${pkgver}.ttf" \
		"${pkgdir}/usr/share/fonts/TTF"

	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 copyright.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}"

	install -d "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 *Sample.pdf readme*.txt \
		"${pkgdir}/usr/share/doc/${pkgname}"
}
