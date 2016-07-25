# Maintainer: Adam Brenner <adam@aeb.io>
# Contributor: Marq Schneider <queueRAM@gmail.com>
# Contributor: Jonathan Arnold <jarnold@buddydog.org>

pkgname=p4
pkgver=2016.1.1411799
pkgrel=1
pkgdesc="Perforce command line client"
depends=('glibc')
arch=('i686' 'x86_64')
url="http://www.perforce.com"
license=('custom:p4')
source=(http://www.perforce.com/downloads/perforce/r${pkgver:2:4}/bin.linux26${CARCH/i6/x}/${pkgname}
        LICENSE)
[ "$CARCH" = "i686" ] && \
sha256sums=('d9c7d3f66bebb2e71100bad94e700ce9e34ee473283943afd5af28349cc0d12b'
         'c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')

[ "$CARCH" = "x86_64" ] && \
sha256sums=('17f814d005cf1063d754d50485fbd2818526a8fdc8264149a85245ae10b0669e'
         'c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')

build() {
  return 0
}

package() {
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -D -m 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
