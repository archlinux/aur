
# Maintainer: Simon Tas <simon.tas.st@gmail.com>
pkgname="django-templated-email"
pkgver=2.2.0
pkgrel=1
pkgdesc="A Django oriented templated / transaction email abstraction"
arch=('any')
url="https://pypi.python.org/pypi/$pkgname"
license=('MIT')
depends=('python-django')
provides=('templated_email')
source=("https://files.pythonhosted.org/packages/78/7f/8b749c363f2ccd6b181dff384f6ae845a0656284ed419a097d98c2a42661/$pkgname-$pkgver.tar.gz")
md5sums=('a8ced4da201726929be9607a1fd9d00c')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
