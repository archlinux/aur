# Maintainer: Chee Sing Lee <cheesinglee+aur@gmail.com>
pkgname=python-minfx
pkgver=1.0.12
pkgrel=1
pkgdesc="The minfx optimization library"
arch=('any')
url="https://gna.org/projects/minfx/"
license=('GPL')
groups=()
depends=('python')
makedepends=()
provides=('python-minfx')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://download.gna.org/minfx/minfx-$pkgver.tar.gz")
md5sums=('887476d5f30ea8dc40c6614d1a8776e8')

package() {
  cd "$srcdir/minfx-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
