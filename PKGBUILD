# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-pushover
pkgname=('python-pushover' 'python2-pushover')
pkgver=0.3
pkgrel=1
pkgdesc="Python library for Pushover notification service."
arch=('any')
url='http://pythonhosted.org/python-pushover/'
license=('GPL')
makedepends=('python-distribute' 'python2-distribute')
source=("https://github.com/Thibauth/python-pushover/archive/v${pkgver}.tar.gz")
sha256sums=('cdfaec28c5cf7816697e4fbe5da4e4b6550d2e9520e6651cf36b32acab3440bf')

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
