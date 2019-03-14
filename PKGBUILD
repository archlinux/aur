# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=python-bashlex
_name=bashlex
pkgver=0.14
pkgrel=1
pkgdesc="Python port of the parser used internally by GNU bash"
arch=('i686' 'x86_64')
url="https://github.com/idank/bashlex"
license=('GPL3')
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(${url}/archive/${pkgver}.tar.gz)
md5sums=('4a62a72f6743fe9c5e2a63d6600fd3a1')

package() {
  cd "$srcdir/$_name-$pkgver"
  # until https://github.com/idank/bashlex/pull/34 is merged
  python setup.py install --root="$pkgdir/" --optimize=1
}
