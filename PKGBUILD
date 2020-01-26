# Maintainer: Georgi <baigeorgi@1mhz.eu>
pkgname=otf-plovdivtypeface
pkgver=1.00
pkgrel=1
pkgdesc="PlovdivTypeface is the first typeface dedicated to the city of Plovdiv, based on the handwriting of its citizens and friends and entirely free to download and use."
arch=('any')
url="https://plovdivtypeface.com"
license=('custom')
provides=('otf-plovdivtypeface')
source=('https://github.com/BaiGeorgi/otf-plovdivtypeface/releases/download/v1.0/PlovdivTypeface-Fonts.zip')
sha256sums=('bfa66552887d2fb3602833a3b24bda84ff7fcae501766d098a5391b22872bec8')

package() {
  install -D -m644 ${srcdir}/PlovdivTypeface-Fonts/License*.pdf "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
  install -d "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 ${srcdir}/PlovdivTypeface-Fonts/OTF/Plovdiv*.otf "${pkgdir}/usr/share/fonts/OTF/"
}

