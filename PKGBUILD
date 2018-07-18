# Maintainer: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=python2-libfwnt
_pkgname=libfwnt
pkgver=20180117
pkgrel=1
pkgdesc="a library for Windows NT data types"
arch=('any')
url="https://github.com/libyal/libfwnt"
license=('LGPL')
groups=()
depends=( 'python2')
makedepends=('python2-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://github.com/libyal/$_pkgname/releases/download/$pkgver/$_pkgname-alpha-$pkgver.tar.gz) 
md5sums=('a9c3229454afba55f0a05bc37131778a')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
