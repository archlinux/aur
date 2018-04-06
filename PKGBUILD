pkgbase=('python-flask-admin')
pkgname=('python-flask-admin')
_module='Flask-Admin'
pkgver='1.5.1'
pkgrel=1
pkgdesc="Simple and extensible admin interface framework for Flask"
url="https://github.com/flask-admin/flask-admin/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/f/flask-admin/Flask-Admin-${pkgver}.tar.gz")
md5sums=('c018e257fa72811075762315714af084')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
