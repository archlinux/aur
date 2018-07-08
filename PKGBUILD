pkgbase=('python-flask-limiter')
pkgname=('python-flask-limiter')
_module='Flask-Limiter'
pkgver='1.0.1'
pkgrel=1
pkgdesc="Rate limiting for flask applications"
url="https://flask-limiter.readthedocs.org"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/f/flask-limiter/Flask-Limiter-${pkgver}.tar.gz")
md5sums=('898179ad582ba389d1ca7a03a3fc384c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
