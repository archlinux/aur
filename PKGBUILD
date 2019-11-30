# Maintainer: Lorenz Steinert <lorenz AT steinerts DOT de>

pkgname=('python2-flufl-lock')
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
makedepends=('python2-setuptools')

package_python2-flufl-lock() {
  depends=('python2')
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
