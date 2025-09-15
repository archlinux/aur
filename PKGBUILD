# Maintainer:  Damir <sudo dot pacman at gmail dot com>

pkgname=otf-basisschrift
pkgdesc="Deutschschweizer Basisschrift typeface (OpenType)"
url='https://basisschrift.ch//'
license=('custom')
pkgver=1
pkgrel=1
arch=('any')
source=(https://www.basisschrift.ch/sites/default/files/DCH-Basisschrift.otf.zip)
md5sums=('f72fdcaa115187ffe643c18d500d4f0b')

package() {
 install -d "${pkgdir}/usr/share/fonts/OTF"
 install -m644 "${srcdir}/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
}

