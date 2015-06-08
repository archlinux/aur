# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-apscheduler
_pkgname=APScheduler
pkgver=3.0.1
pkgrel=1
pkgdesc='Advanced Python Scheduler is a light but powerful in-process task scheduler'
arch=(any)
url=http://pypi.python.org/pypi/APScheduler
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=(http://pypi.python.org/packages/source/A/APScheduler/${_pkgname}-${pkgver}.tar.gz)
md5sums=(7c3687b3dcd645fe9df48e34eb7a7592)

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}
