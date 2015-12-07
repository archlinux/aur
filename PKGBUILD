# Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>

pkgname=('python-django-cors-headers')
pkgver=1.1.0
pkgrel=1
pkgdesc="Django application for handling the server headers required for Cross-Origin Resource Sharing (CORS)"
arch=('any')
url="http://github.com/ottoyiu/django-cors-headers"
depends=('python-django') 
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/d/django-cors-headers/django-cors-headers-${pkgver}.tar.gz")
md5sums=('204728fda96f9951ebfd8c2cabb54dfb')

build() {
  cd ${srcdir}/django-cors-headers-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/django-cors-headers-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
}

