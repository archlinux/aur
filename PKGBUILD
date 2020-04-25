# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgbase='pyocclient'
pkgname=('python-pyocclient' 'python2-pyocclient')
pkgver='0.5'
pkgrel='1'
pkgdesc='Python client library for ownCloud'
arch=('any')
url="https://github.com/owncloud/${pkgbase}"
makedepends=('python' 'python-setuptools'
	     'python2' 'python2-setuptools')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6bb1ae269c29ffc760d00a3e8e8858c5f28cf32be3fbbaa971e10cd75b0c8bc3')

package_python-pyocclient() {
  depends=('python' 'python-requests' 'python-six')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}

package_python2-pyocclient() {
  depends=('python2' 'python2-requests' 'python2-six')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
}
