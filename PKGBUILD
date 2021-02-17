# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=estedad-fonts
pkgver=5.0
pkgrel=2
pkgdesc="A Sans Serif Arabic-Latin text typeface"
url="https://github.com/aminabedi68/Estedad"
arch=(any)
license=('OFL')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}(2)/Estedad-V${pkgver}.zip"
        'LICENSE')

sha256sums=('c630212c9ce28f9f18fe3e8e9dd54ea132352f248e6882236f60bf5de030b8cd'
	        '3a5078ad1010d2715e59b61ac86caf9df2990b7882d2c467ce7f4ae0ba1dfe3a')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/Estedad-v${pkgver}/Static/ttf/"*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/Estedad-v${pkgver}/Static/ttf/FD/"*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/Estedad-v${pkgver}/Variable/ttf/"*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ${srcdir}/LICENSE
}
