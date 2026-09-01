# Contributor: felix
# Contributor: Tushar R <echo dHVzaGFyXzcyN0B5YWhvby5jb20K | base64 -d>
# Contributor: Bernhard Tittelbach <xro -at- realraum -dot- at>
# Maintainer: Emil VATAI (vatai) <emil.vatai@gmail.com>

pkgname=ttf-kanjistrokeorders
pkgver=4.005
pkgrel=2
pkgdesc="Kanji stroke order font"
arch=('any')
license=('custom')
url="http://www.nihilist.org.uk/"
source=("KanjiStrokeOrders_v${pkgver}.zip::https://drive.google.com/uc?export=download&id=1DKZEYA3PJ8ulLnjYDP5bxzJ3SWi59ghr")
sha256sums=("ee3a1e9c9fa6b137b9ba0b9f72eac21a96acd632f65333246fe980b8db0e9930")

package() {
	cd "${srcdir}/KanjiStrokeOrders-4.005"

	install -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 "KanjiStrokeOrders_v${pkgver}.ttf" \
		"${pkgdir}/usr/share/fonts/TTF"

	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 LICENCE.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}"

	install -d "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 *Sample.pdf README*.txt \
		"${pkgdir}/usr/share/doc/${pkgname}"
}
