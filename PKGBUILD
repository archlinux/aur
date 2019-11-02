# Maintainer: Georgi <georgi.patsev@gmail.com>
pkgname=otf-plovdivtypeface
pkgver=0.001
pkgrel=1
pkgdesc="PlovdivTypeface is the first typeface dedicated to the city of Plovdiv, based on the handwriting of its citizens and friends and entirely free to download and use."
arch=('any')
url="https://plovdivtypeface.com"
license=('custom')
provides=('otf-plovdivtypeface')
source=('https://plovdivtypeface.com/download/PlovdivTypeface-Fonts.zip')
sha256sums=('4ed7dd560ffafca7df7070ef09ef7944fce6c8d951766c616ce34577b1a54eb5')

package() {
  install -D -m644 ${srcdir}/PlovdivTypeface-Fonts/License*.pdf "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
  install -d "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 ${srcdir}/PlovdivTypeface-Fonts/OTF/Plovdiv*.otf "${pkgdir}/usr/share/fonts/OTF/"
}

