# Maintainer: Sibidanov Vadim <RobusGrobus95@gmail.com>
pkgname=ttf-astra-sans
pkgver=20200412
pkgrel=1
pkgdesc='Free sans-serif metric-compatible Times New Roman replacement by Paratype'
arch=(any)
depends=(fontconfig xorg-font-utils)
url='https://www.paratype.ru/fonts/pt/pt-astra-sans'
source=('http://webfonts.ru/original/ptastrasans/ptastrasans.zip')
md5sums=('2ae34184e3545c7a6803d93ff2d9c148')
license=('OFL')
install=$pkgname.install

package() {
  install -Dm644 "${srcdir}/PTAstraSans-Bold.ttf" "${pkgdir}/usr/share/fonts/TTF/AstraSans-Bold.ttf"
  install -Dm644 "${srcdir}/PTAstraSans-BoldItalic.ttf" "${pkgdir}/usr/share/fonts/TTF/AstraSans-BoldItalic.ttf"
  install -Dm644 "${srcdir}/PTAstraSans-Italic.ttf" "${pkgdir}/usr/share/fonts/TTF/AstraSans-Italic.ttf"
  install -Dm644 "${srcdir}/PTAstraSans-Regular.ttf" "${pkgdir}/usr/share/fonts/TTF/AstraSans-Regular.ttf"
}
