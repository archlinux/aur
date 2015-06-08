# Maintainer: Ranuka Perera <random@sawrc.com>

pkgname=ibus-singlish
pkgver=20100305
pkgrel=2
pkgdesc="A m17n Keymap file for Sinhala"
arch=('any')
url="http://www.madurax86.com/rsinglish"
license=('GPL')
depends=('ibus' 'ibus-m17n')
source=("http://madurax86.comuv.com/singlish.mim")
md5sums=('72774b4b57270feb5feed0e421ed78cb')

package() {
  mkdir -p ${pkgdir}/usr/share/m17n/
  cp ${srcdir}/singlish.mim ${pkgdir}/usr/share/m17n/
}
