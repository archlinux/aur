# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=ttf-google-sans-flex-variable
pkgver=1.0.0
pkgrel=1
pkgdesc="Google's signature Sans Flex font (variable)"
arch=('any')
url='https://fonts.google.com/specimen/Google+Sans+Flex'
license=('OFL-1.1')
source=(
	'LICENSE'
	'GoogleSansFlex[GRAD,ROND,opsz,slnt,wdth,wght].ttf::https://github.com/google/fonts/raw/refs/heads/main/ofl/googlesansflex/GoogleSansFlex%5BGRAD,ROND,opsz,slnt,wdth,wght%5D.ttf'
)
sha256sums=(
	'867ff1227ceddec975971db4bcaf29538b44c470cecca28b24d882ea8c0334bf'
	'c31a482fbecbf2e07e6890134d20078723aadf732c9b9c6c9a44f86f8265b6fe'
)
package()
{
	install -Dm644 "${srcdir}/GoogleSansFlex[GRAD,ROND,opsz,slnt,wdth,wght].ttf" "${pkgdir}/usr/share/fonts/TTF/GoogleSansFlex[GRAD,ROND,opsz,slnt,wdth,wght].ttf"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
