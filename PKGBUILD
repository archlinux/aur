# Maintainer: Robosky <fangyuhao0612@gmail.com>

pkgname=ttf-mukta
pkgver=2.538
pkgrel=1
pkgdesc="A Unicode compliant, versatile, contemporary, humanist, mono-linear typeface available in seven weights, supporting Devanagari, Gujarati, Tamil and Latin scripts"
arch=('any')
url="https://github.com/EkType/Mukta"
license=('custom: SIL Open Font License 1.1')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/EkType/Mukta/releases/download/${pkgver}/Mukta.Font.Family.${pkgver}.zip"
         "https://raw.githubusercontent.com/EkType/Mukta/master/Copyright.txt")
md5sums=('2c4090880bcf845231e9d86de644f395'
         'ddbd4545d2f8243fa2aabc4d5fbf477a')
         
package() {
	install -d "${pkgdir}/"usr/share/fonts/Mukta
	install -m644 "${srcdir}/"*/*.ttf "${pkgdir}/"usr/share/fonts/Mukta
	install -Dm644 "${srcdir}/"Copyright.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

