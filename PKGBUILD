# Maintainer: Sibidanov Vadim <RobusGrobus95@gmail.com>
pkgname=ttf-astra-serif
pkgver=20200412
pkgrel=1
pkgdesc='Free serif metric-compatible Times New Roman replacement by Paratype'
arch=(any)
depends=(fontconfig xorg-font-utils)
url='https://www.paratype.ru/fonts/pt/pt-astra-serif'
source=('http://webfonts.ru/original/ptastraserif/ptastraserif.zip')
md5sums=('7d52a1451cf3e70f0af82c4ab1161d64')
license=('OFL')
install=$pkgname.install

package() {
  install -Dm644 "${srcdir}/PTAstraSerif-Bold.ttf" "${pkgdir}/usr/share/fonts/TTF/AstraSerif-Bold.ttf"
  install -Dm644 "${srcdir}/PTAstraSerif-BoldItalic.ttf" "${pkgdir}/usr/share/fonts/TTF/AstraSerif-BoldItalic.ttf"
  install -Dm644 "${srcdir}/PTAstraSerif-Italic.ttf" "${pkgdir}/usr/share/fonts/TTF/AstraSerif-Italic.ttf"
  install -Dm644 "${srcdir}/PTAstraSerif-Regular.ttf" "${pkgdir}/usr/share/fonts/TTF/AstraSerif-Regular.ttf"
}
