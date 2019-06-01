# Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname="python-djoser"
_pkgname="djoser"
pkgver=1.7.0
pkgrel=1
pkgdesc="REST version of Django authentication system."
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
license=('MIT')
depends=('python>=2.7' 'python-django>=1.11' 'python-django-rest-framework>=3.7')
provides=('djoser')
source=("https://files.pythonhosted.org/packages/fe/18/f842b1e6466237e35a5b8806905e326dff203217d5b478226f6440188f4f/$_pkgname-$pkgver.tar.gz")
md5sums=('1a160e2c72f575fd3a61bcaa9761e378')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
