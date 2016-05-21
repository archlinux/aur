# Maintainer: Adam Brenner <adam@aeb.io>
# Contributor: Marq Schneider <queueRAM@gmail.com>
# Contributor: Jonathan Arnold <jarnold@buddydog.org>

pkgname=p4
pkgver=2016.1.1387479
pkgrel=1
pkgdesc="Perforce command line client"
depends=('glibc')
arch=('i686' 'x86_64')
url="http://www.perforce.com"
license=('custom:p4')
source=(http://www.perforce.com/downloads/perforce/r${pkgver:2:4}/bin.linux26${CARCH/i6/x}/${pkgname}
        LICENSE)
[ "$CARCH" = "i686" ] && \
sha256sums=('f94e03155cf0e42f3db5a9a64769cec8e7e9d37866f21cb40bec220132823441'
         'c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')

[ "$CARCH" = "x86_64" ] && \
sha256sums=('cee1d58f8cc930f6d24a4420ea451c7aceaf90d3c33642e28ec1bbfd2cc40450'
         'c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')

build() {
  return 0
}

package() {
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -D -m 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
