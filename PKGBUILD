pkgname=python-classutils
pkgver=1.18.0
pkgrel=1
pkgdesc="A collection of utilites to enhance Python classes"
arch=(any)
url="https://bitbucket.org/daycoder/classutils"
license=('custom:PSF')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.io/packages/source/c/classutils/classutils-$pkgver.tar.gz")
sha512sums=('SKIP')

package() {
  cd classutils-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
