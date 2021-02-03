# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=bitrock-unpacker
pkgver=1.1
pkgrel=1
pkgdesc="A tcl script for unpacking bitrock packed archives"
arch=(any)
url="https://github.com/greyltc/bitrock-unpacker/"
license=('MIT')
depends=('sdx' 'tclkit')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greyltc/bitrock-unpacker/archive/v${pkgver}.tar.gz")

sha256sums=('783ce7dd330a0c1c5f1dec7ba51a5c03b17cc20f2c445a0c7dbec5c705b52b9b')

package() {
  cd bitrock-unpacker-${pkgver}
  mv bitrock-unpacker.tcl bitrock-unpacker
  install -m755 -Dt "${pkgdir}"/usr/bin bitrock-unpacker
}
