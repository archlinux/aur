# Maintainer: Aaron Miller <aaronm@cldtk.com>
# Contributor: Adam Brenner <adam@aeb.io>
# Contributor: Marq Schneider <queueRAM@gmail.com>
# Contributor: Jonathan Arnold <jarnold@buddydog.org>

pkgname=p4
pkgver=2018.2.1751184
pkgrel=1
pkgdesc="Perforce command line client"
depends=('glibc')
arch=('i686' 'x86_64')
url="http://www.perforce.com"
license=('custom:p4')
source=(LICENSE)
source_x86_64=("http://www.perforce.com/downloads/perforce/r${pkgver:2:4}/bin.linux26x86_64/${pkgname}")
source_i686=("http://www.perforce.com/downloads/perforce/r${pkgver:2:4}/bin.linux26x86/${pkgname}")
sha256sums=('c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')
sha256sums_x86_64=('1792575ea95aed96bcebc228a4996ee795c50b65b0c2ef8b80221f683ebfad38')
sha256sums_i686=('94bbaa56a844056a31c569fdd012f200ce81ddcd2c77a92bac0c307b99d519b1')

build() {
  return 0
}

package() {
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -D -m 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
