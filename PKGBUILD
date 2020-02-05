# Maintainer: Tom Hacohen <tom@stosb.com>
# Past Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>

pkgname=python-django-cors-headers
pkgver=3.2.1
pkgrel=1
pkgdesc="Django application for handling the server headers required for Cross-Origin Resource Sharing (CORS)"
arch=('any')
url="http://github.com/ottoyiu/django-cors-headers"
depends=('python-django')
makedepends=('python-setuptools')
source=("https://github.com/ottoyiu/django-cors-headers/archive/${pkgver}.tar.gz")
sha512sums=('022985bb4bcd554c62f483db65f494cd23eb6175e148df386c84092cc21a679feda9b94f9fce427cb2df0a1629ed9cd621a0b53f64b5fe345b902eb0708e6a23')

build() {
  cd ${srcdir}/django-cors-headers-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/django-cors-headers-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
}

