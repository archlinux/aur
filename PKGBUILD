# Maintainer: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=python2-biplist
_pkgname=biplist
pkgver=1.0.2
pkgrel=1
pkgdesc="binary plist parser/generator for Python"
arch=('any')
url="https://github.com/wooster/biplist"
license=('BSD')
groups=()
depends=( 'python2')
makedepends=('python2-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://github.com/wooster/$_pkgname/archive/v$pkgver.tar.gz) 
md5sums=('055ceaa84f4871a361fc9377912d7e2a')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
