
# Maintainer: Simon Tas <simon.tas.st@gmail.com>
pkgname="python-djoser"
_pkgname="djoser"
pkgver=1.3.2
pkgrel=1
pkgdesc="REST version of Django authentication system."
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
license=('MIT')
depends=('python>=2.7' 'python-django>=1.11' 'python-django-rest-framework>=3.7')
provides=('djoser')
source=("https://files.pythonhosted.org/packages/89/de/1eefa6a6d8ee1136a4c80bf39f241a6967522ae9df83a45457a1903a0e24/$_pkgname-$pkgver.tar.gz")
md5sums=('c97834759f306978499f0205acf1e0df')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
