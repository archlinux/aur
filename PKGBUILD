pkgname=python-configurationutil
pkgver=3.7.2
pkgrel=1
pkgdesc="A collection of state machine utilities"
arch=(any)
url="https://bitbucket.org/daycoder/configurationutil"
license=('custom:PSF')
makedepends=('python-setuptools')
depends=('python-jsonschema')
source=("https://pypi.io/packages/source/c/configurationutil/configurationutil-$pkgver.tar.gz")
sha512sums=('SKIP')

check() {
  # Not included in release tarball
  cd configurationutil-$pkgver
  # python test_configurationutil.py
}

package() {
  cd configurationutil-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
