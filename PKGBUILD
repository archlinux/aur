# Maintainer : Simon Doppler <dop dot simon at gmail dot com>

_projname=imgurpython
_orgname=imgur
pkgname="python-${_projname}"
pkgver=1.1.8
pkgrel=3
pkgdesc='Imgur API official Python bindings (deprecated)'
arch=('any')
url="https://github.com/${_orgname}/${_projname}"
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/${_orgname}/${_projname}/archive/${pkgver}.tar.gz")
sha256sums=('06b4bea1c0dafe7e36b88388f0ef0e1afdaba0def446c7426a216b7511d5f7c6')

package() {
    cd ${_projname}-${pkgver}
    python setup.py install --root="$pkgdir"
    install -D LICENSE.txt "$pkgdir/usr/share/licenses/python-imgurpython/LICENSE"
}

