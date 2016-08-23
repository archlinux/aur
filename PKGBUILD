# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-apscheduler
_pkgname=APScheduler
pkgver=3.2.0
pkgrel=1
pkgdesc='Advanced Python Scheduler is a light but powerful in-process task scheduler'
arch=(any)
url=http://pypi.python.org/pypi/APScheduler
license=(MIT)
depends=(python-six python-pytz python-tzlocal)
makedepends=(python-setuptools)
source=(https://files.pythonhosted.org/packages/source/A/APScheduler/${_pkgname}-${pkgver}.tar.gz)
md5sums=(db71a9cdf942cb210afe3926bcb0b5ed)

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}
