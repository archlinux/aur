# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-ibis
_pkgname=ibis
pkgver=0.11.2
pkgrel=1
pkgdesc="A pandas-like deferred expression system, with first class SQL support"
arch=('any')
url="https://github.com/ibis-project/ibis"
license=('Apache')
depends=('python' 'python-numpy' 'python-pandas' 'python-toolz')
checkdepends=('python-pytest')
optdepends=()
makedepends=('python-setuptools')
source=("https://github.com/ibis-project/ibis/archive/v$pkgver.tar.gz")
sha256sums=('2b89d636403db05da6a2e0f0ca398db26112bda2fba5ef59a3e7d46e2c70747e')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

#check(){
#  cd "$srcdir/$_pkgname-$pkgver/ibis"
#  py.test
#}
# vim:ts=2:sw=2:et:
