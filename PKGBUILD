# Maintainer: Python Shell <pythonshell@yeah.net>

pkgname=python-flawfinder
pkgver=2.0.4
pkgrel=1
pkgdesc="a program that examines source code looking for security weaknesses"
arch=('i686' 'x86_64')
url="http://www.dwheeler.com/flawfinder"
license=('GPL')
groups=()
depends=('python')
makedepends=()
provides=('flawfinder')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://www.dwheeler.com/flawfinder/flawfinder-${pkgver}.tar.gz")
sha256sums=('43ffe3bd19cafbc4f24c53c6d80810297ebfbf9a72b693e58e59775813ee66ec')

package() {
  cd "$srcdir/flawfinder-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

