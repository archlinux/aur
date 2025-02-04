# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-inputimeout
pkgver=1.0.4
pkgrel=1
pkgdesc="A Python package for multi platform standard input with timeout"
arch=('any')
url="https://github.com/johejo/inputimeout"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d0763d4015ff6d4641b1ff822a32b69293c856226eac83af3bcdd0650490ab2')

build() {
    cd "${pkgname#python-}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname#python-}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
# vim:set ts=4 sw=4 et:
