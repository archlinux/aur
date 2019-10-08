# Maintainer: Aaron Miller <aaronm@cldtk.com>
# Contributor: Adam Brenner <adam@aeb.io>
# Contributor: Marq Schneider <queueRAM@gmail.com>
# Contributor: Jonathan Arnold <jarnold@buddydog.org>

pkgname=p4
pkgver=2019.1.1845410
pkgrel=2
pkgdesc="Perforce command line client"
depends=('glibc')
arch=('i686' 'x86_64')
url="http://www.perforce.com"
license=('custom:p4')
source=(LICENSE)
source_x86_64=("http://www.perforce.com/downloads/perforce/r${pkgver:2:4}/bin.linux26x86_64/${pkgname}"{,.asc})
source_i686=("http://www.perforce.com/downloads/perforce/r${pkgver:2:4}/bin.linux26x86/${pkgname}"{,.asc})
sha256sums=('c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')
sha256sums_i686=('SKIP' 'SKIP')
sha256sums_x86_64=('SKIP' 'SKIP')

# Perforce Software (Package Signing) <support+packaging@perforce.com>
validpgpkeys=('7123CB760FF18869'
              'E58131C0AEA7B082C6DC4C937123CB760FF18869')

build() {
  return 0
}

package() {
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -D -m 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
