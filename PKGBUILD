# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-rocket-errbot
_pkgname=rocket-errbot
pkgver=1.2.5
pkgrel=1
pkgdesc="rocket-errbot cursor movement and graphics"
arch=('any')
url="https://pypi.python.org/pypi/rocket-errbot/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/e9/7f/833358ced9d65165b826f5285db717728a88b06696bc87b602699ebce864/rocket-errbot-$pkgver.tar.gz")
sha256sums=('aa7d9c5fc922d51ba495251de8eb809febddf3962ad2f55b2f3ed32d310f3ea0')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
