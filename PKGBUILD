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
sha256sums=('e66561d780949f890946f707379137390e99dab85a83a873dee54bbdad07a823'
         'c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')

[ "$CARCH" = "x86_64" ] && \
sha256sums=('801bb47c9bbda7914c6cc0d0994230438515356817afaacd084b5ecb16d221f9'
         'c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')

build() {
  return 0
}

package() {
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -D -m 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
