# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=estedad-fonts
pkgver=3.0
pkgrel=1
pkgdesc="A Sans Serif Arabic-Latin text typeface"
url="https://github.com/aminabedi68/Estedad"
arch=(any)
license=('OFL')
depends=('fontconfig')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Estedad-v${pkgver}.zip"
	'LICENSE')

sha256sums=('def4d492f25c457767208edc6452e5c8af1d9cf6262e90202988cedae207a185'
	    '3a5078ad1010d2715e59b61ac86caf9df2990b7882d2c467ce7f4ae0ba1dfe3a')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ${srcdir}/Font/ttf/*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ${srcdir}/LICENSE
}
