# Maintainer: Visa Jokelainen <visaj at iki dot fi>
_pkgname=nadds
pkgname=python2-$_pkgname
pkgver=0.1.2
pkgrel=1
pkgdesc="Low level linux api calls for python"
arch=('i686' 'x86_64')
url="https://github.com/orlof/python-nadds/"
license=('LGPL')
groups=()
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/orlof/python-$_pkgname/archive/$pkgver.tar.gz")
md5sums=(3ab477330bdaaeff10b2d8e658a1d474)

package() {
  cd "$srcdir/python-$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
