# Maintainer: Tom Hacohen <tom@stosb.com>
# Past Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>

pkgname=python-django-cors-headers
pkgver=3.3.0
pkgrel=1
pkgdesc="Django application for handling the server headers required for Cross-Origin Resource Sharing (CORS)"
arch=('any')
url="http://github.com/ottoyiu/django-cors-headers"
depends=('python-django')
makedepends=('python-setuptools')
source=("https://github.com/ottoyiu/django-cors-headers/archive/${pkgver}.tar.gz")
sha512sums=('84650ba3c44738e866cfdf881c6f8ccab4e48bb4b89f68289f5b7947659e3201662c6121f0fd610759c02887e3ae6e7c0502f2181a11e7efd308eed062e726e9')

build() {
  cd ${srcdir}/django-cors-headers-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/django-cors-headers-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
}

