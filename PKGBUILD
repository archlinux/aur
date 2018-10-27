
# Maintainer: Simon Tas <simon.tas.st@gmail.com>
pkgname="django-templated-mail"
pkgver=1.1.1
pkgrel=1
pkgdesc="Send emails using Django template system."
arch=('any')
url="https://pypi.python.org/pypi/$pkgname"
license=('MIT')
depends=('python-django')
provides=('templated_email')
source=("https://files.pythonhosted.org/packages/e7/d3/25f1d97a0117537fecef5bee212afca7265c5fdd7452f638bf9ff9183c1e/$pkgname-$pkgver.tar.gz")
md5sums=('25fd0139c20b8049ae0e37c1c17b37cb')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
