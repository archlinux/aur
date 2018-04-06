# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-ibis
_pkgname=ibis
pkgver=0.13.0
pkgrel=1
pkgdesc="A pandas-like deferred expression system, with first class SQL support"
arch=('any')
url="https://github.com/ibis-project/ibis"
license=('Apache')
depends=('python' 'python-multipledispatch' 'python-numpy' 'python-pandas' 'python-regex' 'python-toolz')
checkdepends=('python-pytest')
optdepends=()
makedepends=('python-setuptools')
source=("https://github.com/ibis-project/ibis/archive/v$pkgver.tar.gz")
sha256sums=('3da1b51c72e074183abb08a2724a5b77f90e7328ab014de5ff7e699daf5c75f9')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

#check(){
#  cd "$srcdir/$_pkgname-$pkgver/ibis"
#  py.test
#}
# vim:ts=2:sw=2:et:
