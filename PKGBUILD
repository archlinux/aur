# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-apscheduler
_pkgname=APScheduler
pkgver=3.3.1
pkgrel=1
pkgdesc='Advanced Python Scheduler is a light but powerful in-process task scheduler'
arch=(any)
url=http://pypi.python.org/pypi/APScheduler
license=(MIT)
depends=(python-six python-pytz python-tzlocal)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/A/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=(6342b3b78b41920a8aa54fd3cd4a299d)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
