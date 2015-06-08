# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-pushover
pkgver=0.2
pkgrel=1
pkgdesc="Python library for Pushover notification service."
arch=('any')
url='http://pythonhosted.org/python-pushover/'
license=('GPL')
depends=('python-requests')
makedepends=('python-distribute')
source=("https://pypi.python.org/packages/source/p/python-pushover/${pkgname}-${pkgver}.tar.gz")
sha256sums=('39eefdcfa2335a4ad98bd321a25b56936abed4ea5922ba3fc372d091273e0775')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
