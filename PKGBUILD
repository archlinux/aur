
# Maintainer: Simon Tas <simon.tas.st@gmail.com>
pkgname="python-djoser"
_pkgname="djoser"
pkgver=1.3.1
pkgrel=1
pkgdesc="REST version of Django authentication system."
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
license=('MIT')
depends=('python>=2.7' 'python-django>=1.11' 'python-django-rest-framework>=3.7')
provides=('djoser')
source=("https://files.pythonhosted.org/packages/dd/8a/39b1b19f8d928fb616664220f964431df685192e24ee142ffd03a68769b5/$_pkgname-$pkgver.tar.gz")
md5sums=('a8d75531b4e289c607482e49957b312d')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
