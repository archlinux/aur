# Maintainer: Adam Brenner <adam@aeb.io>
# Contributor: Marq Schneider <queueRAM@gmail.com>
# Contributor: Jonathan Arnold <jarnold@buddydog.org>

pkgname=p4
pkgver=2015.2.1311674
pkgrel=15
pkgdesc="Perforce command line client"
depends=('glibc')
arch=('i686' 'x86_64')
url="http://www.perforce.com"
license=('custom:p4')
source=(http://www.perforce.com/downloads/perforce/r${pkgver:2:4}/bin.linux26${CARCH/i6/x}/${pkgname}
        LICENSE)
[ "$CARCH" = "i686" ] && \
sha256sums=('a0e575fea0b08785f4fdacc649834a0356034bff2bf9241bdd371ab251880141'
         'c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')

[ "$CARCH" = "x86_64" ] && \
sha256sums=('982e40a1d37e024c946142414eac4feb25a6eb82d233732cb821cee58ea4b85c'
         'c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')

build() {
  return 0
}

package() {
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -D -m 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
