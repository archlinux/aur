
# Maintainer: Simon Tas <simon.tas.st@gmail.com>
pkgname="python-djoser"
_pkgname="djoser"
pkgver=1.4.0
pkgrel=1
pkgdesc="REST version of Django authentication system."
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
license=('MIT')
depends=('python>=2.7' 'python-django>=1.11' 'python-django-rest-framework>=3.7')
provides=('djoser')
source=("https://files.pythonhosted.org/packages/e5/9c/4ae26ea9d0aee68ce77cfc55a01a39cae51c8d08924e51899b24149ee1ae/$_pkgname-$pkgver.tar.gz")
md5sums=('4be2e95ec1f733bdf08be12979f4e800')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
