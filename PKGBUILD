# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Variable sans serif font based on Muli by Vernon Adams'
pkgname=ttf-mulish
pkgver=3.600
pkgrel=1
arch=(any)
url=https://github.com/googlefonts/mulish
license=(custom:OFL)
_commit=6844cf9dd294f736d4864ba270805cb6e5a49403
source=("Mulish[wght].ttf::${url}/raw/${_commit}/fonts/variable/Mulish%5Bwght%5D.ttf"
		"Mulish-Italic[wght].ttf::${url}/raw/${_commit}/fonts/variable/Mulish-Italic%5Bwght%5D.ttf"
		"${url}/raw/${_commit}/OFL.txt")
b2sums=('ff0e0998f7df1fd888f9dfcfb58edc74785887a4aaffbf9422e0bf461d286f2a5f12f16a70a42ed2b99c316eeb41659b38d613ec20198446c1b2aee0568608c1'
        '0b4a270fd2189de172fe4025b2696f0f20e3151029a2ec734d80ac7fb5bfad82147a626e25c969d3b1f58bb038462e8b3139e54eb2fe1bc9183c4d28f200e3ca'
        '287f782607f522869089423ae4faa803802aae1891566d238721a8d75e04d24d7c376b3049dc87df0710bc5c25f73e5cfcb092dd576f2078d21d79862f06f559')

package () {
	install -vDm644 -t "${pkgdir}/usr/share/fonts/${pkgname}/" "${srcdir}"/*.ttf
	install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/OFL.txt"
}
