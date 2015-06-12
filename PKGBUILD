# Maintainer: Jesus Alvarez
pkgname=python-baker
pkgver=1.3
pkgrel=2
pkgdesc="Easy, powerful access to Python functions from the command line."
arch=('x86_64' 'i686')
url="https://bitbucket.org/mchaput/baker/wiki/Home"
license=('Apache License 2.0')
depends=('python')
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/B/Baker/Baker-${pkgver}.tar.gz")
md5sums=('e628d935accf915abf6cdef77b81d8d3')

package() {
  cd "$srcdir/Baker-$pkgver"
  # sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" setup.py
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
