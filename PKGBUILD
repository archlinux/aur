# Maintainer: ValHue <vhuelamo at gmail dot com>
# Contributor: György Balló <ballogy at freestart dot hu>

_pkgname=lazr.uri
pkgname=python2-lazr-uri
pkgver=1.0.3
pkgrel=2
pkgdesc="A self-contained, easily reusable library for parsing, manipulating, and generating URIs"
arch=('any')
url="https://launchpad.net/lazr.uri"
license=('LGPL')
depends=('python2-distribute')
source=("http://launchpad.net/${_pkgname}/trunk/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz")
md5sums=('1ae177e147092ae934b7edc3f8555665')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
