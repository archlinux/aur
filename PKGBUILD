# Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname="python-djoser"
_pkgname="djoser"
pkgver=1.5.1
pkgrel=1
pkgdesc="REST version of Django authentication system."
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
license=('MIT')
depends=('python>=2.7' 'python-django>=1.11' 'python-django-rest-framework>=3.7')
provides=('djoser')
source=("https://files.pythonhosted.org/packages/1c/f3/cb775aa51e371c4f1bc6e94ac527e5ac272e4e736942a4a331227b69c7b5/$_pkgname-$pkgver.tar.gz")
md5sums=('ffc005375d17799ad1bbe0c98b913773')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
