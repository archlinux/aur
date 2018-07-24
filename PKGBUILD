# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=python-pyfastogt
pkgver=0.0.1
pkgrel=1
arch=('any')
url="https://fastonosql.com"
license=('MIT')
pkgdesc="FastoGT python files"
depends=()
makedepends=()
conflicts=()
source=("${pkgname%-git}::git+https://github.com/fastogt/pyfastogt.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  python "setup.py" build
}

package() {
  cd "$srcdir/$pkgname"
  python "setup.py" install --root="$pkgdir/" --optimize=1 --skip-build
}
