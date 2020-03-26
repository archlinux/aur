# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=estedad-fonts
pkgver=4.0
pkgrel=1
pkgdesc="A Sans Serif Arabic-Latin text typeface"
url="https://github.com/aminabedi68/Estedad"
arch=(any)
license=('OFL')
depends=('fontconfig')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Estedad.V${pkgver}.zip"
        'LICENSE')

sha256sums=('78f2f2e73da4520b48d02bf86480d641d02461f7bb471d3b987efb495cf0c803'
	        '3a5078ad1010d2715e59b61ac86caf9df2990b7882d2c467ce7f4ae0ba1dfe3a')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/Std (Standard)/instances/"*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/FD (Farsi digits)/instances/"*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/OA (only Arabic glyphs)/instances/"*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/Std (Standard)/variable/"*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/FD (Farsi digits)/variable/"*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/OA (only Arabic glyphs)/variable/"*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ${srcdir}/LICENSE
}
