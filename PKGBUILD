# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=msgfplus
pkgver=9979
pkgrel=1
pkgdesc="MS/MS database search tool"
arch=('any')
url="https://bix-lab.ucsd.edu/pages/viewpage.action?pageId=13533355"
license=('custom')
depends=('java-runtime')
source=("http://proteomics.ucsd.edu/Software/MSGFPlus/MSGFPlus.zip"
		"msgf+"
		"mzid2tsv")
md5sums=('938cca2139fdbb3e678f0c4e5971950d'
		 'c43c6581b373266171c3930c3718eb9c'
		 'c860b9c30b74dae43de2d3933a405ac1')

package() {
	cd "$srcdir"
	install -D MSGFPlus.jar "${pkgdir}/usr/share/java/${pkgname}/MSGFPlus.jar"
	install -D LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -D Mods.txt "${pkgdir}/usr/share/${pkgname}/Mods.txt"
	install -D msgf+ "${pkgdir}/usr/bin/msgf+"
	install -D mzid2tsv "${pkgdir}/usr/bin/mzid2tsv"
}
