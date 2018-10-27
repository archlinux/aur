
# Maintainer: Simon Tas <simon.tas.st@gmail.com>
pkgname="django-sendmail-backend"
_pkgname="django_sendmail_backend"
pkgver=0.1.2
pkgrel=1
pkgdesc="Its a simple command line sendmail backend for Django"
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
license=('BSD')
depends=('python-django')
source=("https://files.pythonhosted.org/packages/8d/02/923777c2c311ab5dfc3bdf8762cded1fdf69569803bea7c4ff11503c5a73/$_pkgname-$pkgver.tar.gz")
md5sums=('0f4be94627b148b675e140f5fd030f75')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
    
}
 
