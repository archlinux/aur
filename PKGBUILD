# Maintainer: Jonathan Arnold <jarnold@buddydog.org>
# Contributor: Marq Schneider <queueRAM@gmail.com>

pkgname=p4
pkgver=2015.1.1054991
pkgrel=13
pkgdesc="Perforce commandline client"
depends=('glibc')
arch=('i686' 'x86_64')
url="http://www.perforce.com"
license=('custom:p4')
source=(http://www.perforce.com/downloads/perforce/r${pkgver:2:4}/bin.linux26${CARCH/i6/x}/${pkgname}
        LICENSE)
[ "$CARCH" = "i686" ] && \
sha256sums=('71d6628da50562062e6123eaf1416c422fd12ab9c635bb3d0419abab6584b8ba'
         'c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')

[ "$CARCH" = "x86_64" ] && \
sha256sums=('b59b220e2e8e11ec2a3d5fbb1d05d92e6d8a230f52c5766e2ff2ca04b2ff8524'
         'c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')

build() {
  return 0
}

package() {
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -D -m 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
