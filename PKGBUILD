# Maintainer: Simon Kohlmeyer <simon.kohlmeyer@gmail.com>
_modulename=tasklib
pkgname=python-$_modulename
pkgver=1.1.0
pkgrel=1
pkgdesc="Python library for interacting with taskwarrior databases."
arch=(any)
url="https://github.com/robgolding/tasklib"
license=('BSD')
groups=()
depends=('python' 'python-six' 'python-pytz' 'python-tzlocal')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=('https://github.com/robgolding/tasklib/archive/1.1.0.tar.gz')
sha256sums=('d0a1b80e95d8dbed856e5596aa5398a55a7762e3e1916522e37f2e9b3e397c0e')

package() {
  cd "$srcdir/$_modulename-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
#TODO: install license to /usr/share/licenses/python-tasklib

# vim:set ts=2 sw=2 et:
