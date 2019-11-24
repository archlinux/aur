pkgname=python-stateutil
pkgver=1.4.0
pkgrel=1
pkgdesc="A collection of state machine utilities"
arch=(any)
url="https://bitbucket.org/daycoder/stateutil"
license=('custom:PSF')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.io/packages/source/s/stateutil/stateutil-$pkgver.tar.gz")
sha512sums=('SKIP')

check() {
  # Not included in release tarball
  cd stateutil-$pkgver
  # python test_stateutil.py
}

package() {
  cd stateutil-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
