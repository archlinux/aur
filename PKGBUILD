# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-pushover
pkgver=0.4
pkgrel=2
pkgdesc="Python library for Pushover notification service."
arch=('any')
url='http://pythonhosted.org/python-pushover/'
license=('GPL')
depends=('python-requests')
makedepends=('python-distribute')
source=("https://github.com/Thibauth/python-pushover/archive/v${pkgver}.tar.gz")
sha256sums=('455ad02b20ce6c34b6857a2c2ad9fa9ca27a698fc76793a68e76213633bcb5b8')

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
