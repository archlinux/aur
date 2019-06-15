# Contributor: Doron Behar <doron.behar@gmail.com>
# Maintainer: hexchain <i@hexchain.org>

_name=bashlex
pkgname=python-bashlex
pkgver=0.14
pkgrel=1
pkgdesc="Python port of the parser used internally by GNU bash"
arch=('i686' 'x86_64')
url="https://github.com/idank/bashlex"
license=('GPL3')
depends=('python')
source=(${url}/archive/${pkgver}.tar.gz)
sha256sums=('d32d1f929e2299660b5a7258068ac3708046c41d806223c8ecdc00b893548b2a')

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
