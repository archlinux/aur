# Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname="python-djoser"
_pkgname="djoser"
pkgver=1.5.0
pkgrel=1
pkgdesc="REST version of Django authentication system."
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
license=('MIT')
depends=('python>=2.7' 'python-django>=1.11' 'python-django-rest-framework>=3.7')
provides=('djoser')
source=("https://files.pythonhosted.org/packages/59/20/05ccfb0479abd605a6b30892f3e99da6959948aaca01760cbea0bc64bccb/$_pkgname-$pkgver.tar.gz")
md5sums=('5c148974abefc660d289337ecd08993f')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
