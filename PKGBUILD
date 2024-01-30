# Maintainer: vcalv

pkgname=ttf-topaz
pkgver=1.0
pkgrel=3
pkgdesc="Amiga 500 Topaz font updated for the 21st century"
arch=('any')
url="https://gitlab.com/Screwtapello/topaz-unicode"
license=('custom:ISC')
depends=()
conflicts=()
_artifact='6036905109'
source=(
	"${pkgname}_artifact_${_artifact}.zip::https://gitlab.com/Screwtapello/topaz-unicode/-/jobs/${_artifact}/artifacts/download"
	'https://gitlab.com/Screwtapello/topaz-unicode/-/raw/eaebcb1fa155752cfc0042c66c2a280561937615/LICENSE'
)
sha512sums=(
	'8ab867faa3f21f806c0657550f04d5f2bc6ddfa7ad6a5776690a1f24bd36d6008a1b876349632287110645811742be163880b38686b2d91df2ade07f3af2d16a'
	'b96b51fc620da3403b59ad7a48d49390a4a97fa4c19a7052d6dab6836faa43bdda3b0123dec0aa1ef8df073b17e173fdcd2b5bbe9e9a8460b85cd103b3d36f76'
)


#build() {
	#cd ${srcdir}/${_pkgname}
	#gzip -9 -k -v topaz_unicode_ks13-16.psf
#}

package() {
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  #install -Dm644 -t "${pkgdir}//usr/share/kbd/consolefonts/" *.psf*
}


