# Maintainer: Florijan Hamzic <florijanh@gmail.com>
# Copyright (C) 2008 John Paulett (john -at- paulett.org)
# Copyright (C) 2009, 2011, 2013 David Aguilar (davvid -at- gmail.com)
# All rights reserved.

_pkgname="python-jsonpickle"
pkgname="${_pkgname}"
pkgver=0.7.0
pkgrel=1
pkgdesc="Python library for serializing any arbitrary object graph into JSON."
arch=('i686' 'x86_64')
url="http://jsonpickle.github.io/"
license=('New BSD')
depends=('python>=3.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(https://pypi.python.org/packages/source/j/jsonpickle/jsonpickle-${pkgver}.tar.gz)
md5sums=('41418970dcc9b19f698145054fba5549')

package() {
  cd "${srcdir}/jsonpickle-${pkgver}"

  python setup.py install --root="$pkgdir" --prefix=/usr
}
