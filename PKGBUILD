# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=python2-logfury
pkgver=0.1.2
pkgrel=3
pkgdesc="Responsible, low-boilerplate logging of method calls for python libraries"
arch=('any')
url="https://github.com/ppolewicz/logfury"
license=('BSD')
groups=()
depends=('python2' 'python2-funcsigs' 'python2-six>=1.10')
makedepends=('python2-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("logfury-${pkgver}.tar.gz::https://github.com/ppolewicz/logfury/archive/${pkgver}.tar.gz")
md5sums=('39eafcdd8e5904dce1efc2667496590f')

package() {
  cd "$srcdir/logfury-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -D LICENSE.txt "$pkgdir/usr/share/licenses/python2-logfury/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
