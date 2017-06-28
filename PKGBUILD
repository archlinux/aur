# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=bitrock-unpacker
pkgver=1.0
pkgrel=1
pkgdesc="this is a tcl script for unpacking bitrock packed archives"
arch=(i686 x86_64)
url="https://github.com/greyltc/bitrock-unpacker/"
license=('MIT')
depends=(sdx)
depends_i688=(tclkit)
depends_x86_64=(lib32-tclkit)

source=("https://github.com/greyltc/bitrock-unpacker/archive/v${pkgver}.tar.gz")
md5sums=('0cf9408b717d1d831611c2c35cb2cbd4')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  cp bitrock-unpacker.tcl "${pkgdir}/usr/bin/bitrock-unpacker"
}
