# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=ttf-google-sans-flex-variable
pkgver=1.0.1
pkgrel=1
pkgdesc="Google's signature Sans Flex font (variable)"
arch=('any')
url='https://fonts.google.com/specimen/Google+Sans+Flex'
license=('OFL-1.1')
source=(
	'GoogleSansFlex[ROND,opsz,slnt,wdth,wght].ttf::https://github.com/google/fonts/raw/refs/heads/main/ofl/googlesansflex/GoogleSansFlex%5BROND,opsz,slnt,wdth,wght%5D.ttf'
)
sha256sums=(
	'a9ac770798857d5e8ac593ced42b22e40a7c08cec98319f92b0eccc2783a77ba'
)
package()
{
	install -Dm644 "${srcdir}/GoogleSansFlex[ROND,opsz,slnt,wdth,wght].ttf" "${pkgdir}/usr/share/fonts/TTF/GoogleSansFlex[ROND,opsz,slnt,wdth,wght].ttf"
}
