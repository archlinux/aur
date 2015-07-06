# Maintainer: masutu Subric <masutu dot arch at gmail dot com>
# Contributor: masutu Subric <masutu dot arch at gmail dot com>
pkgname=python2-powerlaw
_module_name=powerlaw
pkgver=1.3.4
pkgrel=1
pkgdesc="Toolbox for testing if a probability distribution fits a power law"
arch=(any)
url="https://github.com/jeffalstott/powerlaw"
license=('GPL')
depends=('python2-scipy')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/${_module_name}/${_module_name}-${pkgver}.tar.gz")
md5sums=('a5de54dafdb1e7b314a6bd260a1d56a7')

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
