# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=ttf-whatever-it-takes
pkgver=20201230
pkgrel=1
pkgdesc="Handwritten chalkboard typeface"
arch=(any)
source=(https://www.makerstype.com/wp-content/uploads/2020/12/Whatever-It-Takes.zip)
sha512sums=('a9e44e09a6a18d9f36279ca48c13a5b7c059bdcf7cf8afbbcd37b70e40b1bb6d6624f5a61c7b032812ffc2de7866daab41f040faee54061f8f546f311767ecf2')
license=('custom')

package() {
	install -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"
	install -D -m644 "${srcdir}/Font ReadMe- Whatever It Takes.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
