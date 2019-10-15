# Maintainer: RhiobeT (Pierre Jeanjean) <rhiobet@gmail.com>
pkgname=amaranth-font
pkgver=1.0.0
pkgrel=1
pkgdesc="A friendly upright italic design with a slight contrast and distinctive curves"
arch=('any')
url="https://fonts.google.com/specimen/Amaranth"
license=('GPL-2')
makedepends=('unzip')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("Amaranth.zip::https://fonts.google.com/download?family=Amaranth")
md5sums=('0db6381ed4729b4207d098fbc01d88f7')

package () {
  mkdir "${srcdir}/${pkgname}-${pkgver}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  unzip "${srcdir}/Amaranth.zip"

  install -d "${pkgdir}/usr/share/fonts/amaranth"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/amaranth/"
  install -m644 OFL.txt "${pkgdir}/usr/share/fonts/amaranth/"
}
