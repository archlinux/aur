# Maintainer: Lorenz Steinert <lorenz AT steinerts DOT de>

pkgname=('python2-flufl-lock')
_pkgbase='flufl.lock'
pkgver=2.4.1
pkgrel=1
pkgdesc="NFS-safe file locking with timeouts for POSIX systems"
arch=(any)
url="https://gitlab.com/warsaw/flufl.lock"
license=('LGPL')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/f/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('72639aca3ef0379aef125c7346b042691c3452152843f301801b3c2ddcac1032')
makedepends=('python2-setuptools')

package_python2-flufl-lock() {
  depends=('python2')
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
