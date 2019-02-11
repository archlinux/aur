# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-pushover
pkgname=('python-pushover' 'python2-pushover')
pkgver=0.4
pkgrel=1
pkgdesc="Python library for Pushover notification service."
arch=('any')
url='http://pythonhosted.org/python-pushover/'
license=('GPL')
makedepends=('python-distribute' 'python2-distribute')
source=("https://github.com/Thibauth/python-pushover/archive/v${pkgver}.tar.gz")
sha256sums=('455ad02b20ce6c34b6857a2c2ad9fa9ca27a698fc76793a68e76213633bcb5b8')

package_python-pushover() {
  depends=('python-requests')
  pkgdesc="Python library for Pushover notification service. (python3 version)"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root=${pkgdir} 
}

package_python2-pushover() {
  depends=('python2-requests')
  pkgdesc="Python library for Pushover notification service. (python2 version)"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python2 setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
