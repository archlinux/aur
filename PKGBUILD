# Maintainer: Aaron Miller <aaronm@cldtk.com>
# Contributor: Adam Brenner <adam@aeb.io>
# Contributor: Marq Schneider <queueRAM@gmail.com>
# Contributor: Jonathan Arnold <jarnold@buddydog.org>

pkgname=p4
pkgver=2019.1.1751184
pkgrel=2
pkgdesc="Perforce command line client"
depends=('glibc')
arch=('i686' 'x86_64')
url="http://www.perforce.com"
license=('custom:p4')
source=(LICENSE)
source_x86_64=("http://www.perforce.com/downloads/perforce/r${pkgver:2:4}/bin.linux26x86_64/${pkgname}")
source_i686=("http://www.perforce.com/downloads/perforce/r${pkgver:2:4}/bin.linux26x86/${pkgname}")
sha256sums=('c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')
sha256sums_i686=('d9677042a2e50e90c576c369fe58344ba2da93eb699c97d6417dc4e497a95beb')
sha256sums_x86_64=('c521b4ccee92d5f2b5307795ae54dda9d6f3a08c6abe976fac5e0637d662b464')

build() {
  return 0
}

package() {
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -D -m 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
