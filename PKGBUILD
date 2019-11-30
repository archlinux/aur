# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-flufl-lock')
_pkgbase='flufl.lock'
pkgver=2.4.1
pkgrel=1
pkgdesc="NFS-safe file locking with timeouts for POSIX systems"
arch=(any)
url="https://launchpad.net/flufl.lock"
license=('LGPL')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/f/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('72639aca3ef0379aef125c7346b042691c3452152843f301801b3c2ddcac1032')
makedepends=('python-setuptools')

package_python-flufl-lock() {
  depends=('python')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
