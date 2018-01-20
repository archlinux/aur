# Maintainer: Hugo Rodrigues <me@hugorodrigues.net>
_pipname=sparkpost
pkgname=python2-${_pipname}
pkgver=1.3.5
pkgrel=1
pkgdesc="SparkPost client library for Python2"
arch=("any")
url="https://github.com/SparkPost/python-sparkpost"
license=("Apache")
depends=("python2")
makedepends=("python2-pip")

build() {
  pip2 install --no-deps --target="${_pipname}" ${_pipname}==${pkgver}
}

package() {
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages/
  cp -r $srcdir/${_pipname}/* $pkgdir/usr/lib/python2.7/site-packages/
}

