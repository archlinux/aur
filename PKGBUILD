# Maintainer: masutu Subric <masutu dot arch at gmail dot com>
# Contributor: masutu Subric <masutu dot arch at gmail dot com>
pkgname=python2-powerlaw
_module_name=powerlaw
pkgver=1.4.3
pkgrel=1
pkgdesc="Toolbox for testing if a probability distribution fits a power law"
arch=(any)
url="https://github.com/jeffalstott/powerlaw"
license=('GPL')
depends=('python2-scipy')
options=(!emptydirs)
source=("https://pypi.python.org/packages/83/7e/12756bfd0a98fda04e35b25353a6870dbcd53680faca3b77ff044cc65fec/${_module_name}-${pkgver}.tar.gz")
md5sums=('2ea92f975361594767b652d863909d2e')

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
