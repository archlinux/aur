# Maintainer: Tom Hacohen <tom@stosb.com>
# Past Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>

pkgname=python-django-cors-headers
pkgver=3.4.0
pkgrel=1
pkgdesc="Django application for handling the server headers required for Cross-Origin Resource Sharing (CORS)"
arch=('any')
url="http://github.com/ottoyiu/django-cors-headers"
depends=('python-django')
makedepends=('python-setuptools')
source=("https://github.com/ottoyiu/django-cors-headers/archive/${pkgver}.tar.gz")
sha512sums=('95ade44a4d5c29670e8217d97bfcd351058f544255919d7493622f870aeae711b4dd593f8c6ea862834a56f026cf7ba7673ca482d5aebf98474e999008134713')

build() {
  cd ${srcdir}/django-cors-headers-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/django-cors-headers-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
}

