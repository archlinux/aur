# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=bitrock-unpacker
pkgver=1.1
pkgrel=1
pkgdesc="this is a tcl script for unpacking bitrock packed archives"
arch=(any)
url="https://github.com/greyltc/bitrock-unpacker/"
license=('MIT')
depends=('sdx' 'tclkit')

source=("https://github.com/greyltc/bitrock-unpacker/archive/v${pkgver}.tar.gz")
md5sums=('bd515e5db5c2a8e0f2f52078246eebc2')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  cp bitrock-unpacker.tcl "${pkgdir}/usr/bin/bitrock-unpacker"
}
