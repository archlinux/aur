# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>
# Contributer: XZS <d dot f dot fischer at web dot de>

_gitname=path-and-address

pkgver=1.0.0
pkgname=python-$_gitname
pkgrel=1
pkgdesc="Functions for server CLI applications used by humans."
arch=('any')
url="https://github.com/joeyespo/path-and-address"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/joeyespo/$_gitname/archive/v${pkgver}.tar.gz")
md5sums=('74c53ac1c056c62755d1d5833311ef35')

package() {
  cd "$srcdir/$_gitname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
