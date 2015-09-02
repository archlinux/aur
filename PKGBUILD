# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <aaron.l.france@gmail.com>
pkgname=protoc-gen-lisp
pkgver=0.0.1
pkgrel=1
pkgdesc="A protobuf-compiler plugin for Common Lisp"
arch=('i686' 'x86_64')
url="https://github.com/brown/protobuf"
license=('BSD')
depends=('protobuf')
makedepends=('make')
provides=('protoc-gen-lisp')
source=(git://github.com/brown/protobuf.git)
md5sums=(SKIP)


package() {
  cd protobuf/protoc/lisp
  make INSTALL_ROOT="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
