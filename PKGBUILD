
# Maintainer: Simon Tas <simon.tas.st@gmail.com>
pkgname="django-templated-email"
pkgver=2.3.0
pkgrel=1
pkgdesc="A Django oriented templated / transaction email abstraction"
arch=('any')
url="https://pypi.python.org/pypi/$pkgname"
license=('MIT')
depends=('python-django')
provides=('templated_email')
source=("https://files.pythonhosted.org/packages/62/73/515aa27ad1cc49e77cba33f9d1aa9ca6f0414f2bf9a61ea9df92ecea0677/$pkgname-$pkgver.tar.gz")
md5sums=('869d60ebc2bb70db66287d32a37325c0')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
