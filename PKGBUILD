# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=estedad-fonts
pkgver=7.1
pkgrel=1
pkgdesc="A Sans Serif Arabic-Latin text typeface"
url="https://github.com/aminabedi68/Estedad"
arch=(any)
license=('OFL')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Estedad-v${pkgver}.zip"
        'LICENSE')

sha256sums=('15c08f3a390001b9356765aa658a749a392d48827cf3780d82f0aa7a632851e3'
						'3a5078ad1010d2715e59b61ac86caf9df2990b7882d2c467ce7f4ae0ba1dfe3a')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/Estedad-v${pkgver}/ttf/"*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/Estedad-v${pkgver}/ttf/FD/"*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/Estedad-v${pkgver}/Variable/"*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ${srcdir}/LICENSE
}
