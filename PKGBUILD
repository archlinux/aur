# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
pkgname=python-flask-limiter
pkgver=1.1.0
pkgrel=1
pkgdesc="Rate limiting for flask applications"
url="https://flask-limiter.readthedocs.org"
depends=('python' 'python-flask' 'python-six' 'python-limits')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/f/flask-limiter/Flask-Limiter-${pkgver}.tar.gz")
md5sums=('e96f02fa9092207eaeae96cf180f479a')

build() {
    cd "${srcdir}/Flask-Limiter-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/Flask-Limiter-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
