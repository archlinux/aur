# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-django-channels-redis
_pypi_pkgname=channels_redis
<<<<<<< HEAD
pkgver=4.2.0
pkgrel=0
=======
pkgver=4.1.0
pkgrel=2
>>>>>>> a1d51eb18e6b10302bd240f75206d1653d8976d3
pkgdesc="Redis-backed ASGI channel layer implementation"
arch=(any)
url=" http://github.com/django/channels_redis/"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django-channels' 'python-redis' 'python-msgpack' 'python-asgiref')
optdepends=('python-cryptography')
source=("https://pypi.io/packages/source/c/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('01c26c4d5d3a203f104bba9e5585c0305a70df390d21792386586068162027fd')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
