# Maintainer: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=python2-dtfabric
_pkgname=dtfabric
pkgver=20180707
pkgrel=1
pkgdesc="a project to manage data types and structures"
arch=('any')
url="https://github.com/libyal/dtfabric"
license=('APACHE')
groups=()
depends=( 'python2')
makedepends=('python2-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://github.com/libyal/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz)
md5sums=('08b4b4ec3fed2a64895a7f420a3e15e9')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
