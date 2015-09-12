# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-flufl-lock' 'python2-flufl-lock')
_pkgbase='flufl.lock'
pkgver=2.3.1
pkgrel=1
pkgdesc="NFS-safe file locking with timeouts for POSIX systems"
arch=(any)
url="https://launchpad.net/flufl.lock"
license=('LGPL')
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/f/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('a693064d05fd92035989a6addbe92cbeb3291c11f5725ec3d381b2acb37c9079')

package_python-flufl-lock() {
  depends=('python')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-flufl-lock() {
  depends=('python2')
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
