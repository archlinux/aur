pkgbase=('python-flask-admin')
pkgname=('python-flask-admin')
_module='Flask-Admin'
pkgver='1.5.2'
pkgrel=1
pkgdesc="Simple and extensible admin interface framework for Flask"
url="https://github.com/flask-admin/flask-admin/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/f/flask-admin/Flask-Admin-${pkgver}.tar.gz")
md5sums=('0e42ca7da24017ca6c8d699d8dbec4ca')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
