# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-procname
pkgver=0.3
pkgrel=4
pkgdesc="Set process titles in Python programs"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/procname"
license=('LGPL')
depends=('python2')
source=(https://pypi.python.org/packages/source/p/procname/procname-${pkgver}.tar.gz)
md5sums=('0c5c652d6be27167a81742e5c3d5f4df')
sha256sums=('bcf345b4043a155953340b718d560c79c752221003df5e68f638e81df8827a11')
 
build() {
  cd procname-${pkgver}
  python2 setup.py build
}

package() {
  cd procname-${pkgver}
  python2 setup.py install --root="$pkgdir" --optimize=1

}