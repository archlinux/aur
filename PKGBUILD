# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Your Name <youremail@domain.com>
_name=yappi
_py=python2
pkgname=$_py-$_name
pkgver=0.82
pkgrel=1
pkgdesc="Yet Another Python Profiler, but this time Thread-Aware"
arch=(any)
url="http://code.google.com/p/$_name/"

license=('MIT')
groups=()
depends=($_py)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://yappi.googlecode.com/files/$_name-$pkgver.tar.gz")
md5sums=('3386a00eca61c490db521ebd96390bdd')

package() {
  cd "$srcdir/$_name-$pkgver"
  $_py setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
