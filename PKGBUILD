# Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname="python-djoser"
_pkgname="djoser"
pkgver=2.0.3
pkgrel=1
pkgdesc="REST version of Django authentication system."
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
license=('MIT')
depends=('python>=2.7' 'python-django>=1.11' 'python-django-rest-framework>=3.7')
provides=('djoser')
source=("https://files.pythonhosted.org/packages/97/08/c3df7cfa8c5edb3c665e2050246d5b8158c96c2b89b92f6c27895e8ffbf2/$_pkgname-$pkgver.tar.gz")
md5sums=('5acb14742722ddfa55b7252ee7695853')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
