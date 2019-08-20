# Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname="python-djoser"
_pkgname="djoser"
pkgver=2.0.2
pkgrel=1
pkgdesc="REST version of Django authentication system."
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
license=('MIT')
depends=('python>=2.7' 'python-django>=1.11' 'python-django-rest-framework>=3.7')
provides=('djoser')
source=("https://files.pythonhosted.org/packages/04/b0/2c61cdea42d540c86bdf5a68b4ceff3c1614105709b44c7f2a841d14a83e/$_pkgname-$pkgver.tar.gz")
md5sums=('d542256948fd49c12bfdb96535501bba')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
