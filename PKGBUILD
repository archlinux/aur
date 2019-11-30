# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-flufl-lock')
_pkgbase='flufl.lock'
pkgver=3.2
pkgrel=1
pkgdesc="NFS-safe file locking with timeouts for POSIX systems"
arch=(any)
url="https://gitlab.com/warsaw/flufl.lock"
license=('LGPL')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/f/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('a8d66accc9ab41f09961cd8f8db39f9c28e97e2769659a3567c63930a869ff5b')
makedepends=('python-setuptools')

package_python-flufl-lock() {
  depends=('python')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
