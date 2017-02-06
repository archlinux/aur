# Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>

pkgname=('python-django-cors-headers')
pkgver=2.0.2
pkgrel=1
pkgdesc="Django application for handling the server headers required for Cross-Origin Resource Sharing (CORS)"
arch=('any')
url="http://github.com/ottoyiu/django-cors-headers"
depends=('python-django') 
makedepends=('python-setuptools')
source=("https://github.com/ottoyiu/django-cors-headers/archive/${pkgver}.tar.gz")
md5sums=('614de0b21498ec549c9320de5e12594f')

build() {
  cd ${srcdir}/django-cors-headers-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/django-cors-headers-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
}

