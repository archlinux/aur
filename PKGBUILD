# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=estedad-fonts
pkgver=6.1
pkgrel=1
pkgdesc="A Sans Serif Arabic-Latin text typeface"
url="https://github.com/aminabedi68/Estedad"
arch=(any)
license=('OFL')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Estedad-v${pkgver}.zip"
        'LICENSE')

sha256sums=('dcd051b11813d7bbe66cf1ab3642093336156674af0525ba88d7f7f17f8f1ca7'
	        '3a5078ad1010d2715e59b61ac86caf9df2990b7882d2c467ce7f4ae0ba1dfe3a')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/Estedad-v${pkgver}/Estedad-v${pkgver}/Statics/ttf/"*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/Estedad-v${pkgver}/Estedad-v${pkgver}/Statics/ttf/FD/"*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/Estedad-v${pkgver}/Estedad-v${pkgver}/Variable/ttf/"*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ${srcdir}/LICENSE
}
