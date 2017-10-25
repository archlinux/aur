# Maintainer: DATSD <DAStudio *dot* 71e6fd52 *at* gmail *dot* com>
# Contributor: quomoow <quomoow@gmail.com>

pkgname=python-structlog
pkgver=16.1.0
pkgrel=1
pkgdesc="Structured logging for Python"
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools')
url="http://www.structlog.org"
license=('Apache' 'MIT')
options=(!emptydirs)
source=("git+https://github.com/quomoow/${pkgname}.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
