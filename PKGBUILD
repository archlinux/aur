# Maintainer: Yardena Cohen <yardenack at gmail dot com>

_pkgname=tqdm
pkgname=python-${_pkgname}
pkgver=1.0
pkgrel=1
pkgdesc="Simple Python Progress Meter"
arch=('any')
url="https://pypi.python.org/pypi/tqdm"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
depends=('python')
options=('!emptydirs')
provides=('python2-tqdm')
conflicts=('python2-tqdm')
source=(https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('d4972cfd62cf50bf88f20749b536258a3f48b31515dea3ad5edd5fe52e742c6c')

package() {
	 cd "${srcdir}/${_pkgname}-${pkgver}"
	 python  setup.py install --root="${pkgdir}" --optimize=1
	 python2 setup.py install --root="${pkgdir}" --optimize=1
}
