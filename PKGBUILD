# Maintainer: Hugo Rodrigues <me@hugorodrigues.net>
_pipname=sparkpost
pkgname=python-${_pipname}
pkgver=1.3.5
pkgrel=1
pkgdesc="SparkPost client library for Python"
arch=("any")
url="https://github.com/SparkPost/python-sparkpost"
license=("Apache")
depends=("python")
makedepends=("python-pip")

build() {
  pip install --no-deps --target="${_pipname}" ${_pipname}==${pkgver}
}

package() {
  mkdir -p $pkgdir/usr/lib/python3.6/site-packages/
  cp -r $srcdir/${_pipname}/* $pkgdir/usr/lib/python3.6/site-packages/
}

