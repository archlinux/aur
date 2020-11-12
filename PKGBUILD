# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-compiler
pkgver=1.1
pkgrel=2
pkgdesc='The compiler package from Python 2, ported to Python 3'
arch=(any)
url='https://github.com/pfalcon/python-compiler'
license=(custom)
makedepends=(git python python-setuptools)
source=("git+https://github.com/pfalcon/python-compiler#commit=e71a47b4bf6570afe12ebb4a16fb70561c134e98") # version 1.1
sha256sums=('SKIP')

build(){
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
