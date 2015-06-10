# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=python2-pylearn2
pkgver=0.1
pkgrel=1
pkgdesc='Machine learning library based on Theano'
arch=('any')
url='http://github.com/lisa-lab/pylearn2'
license=('GPL')
depends=('python2-theano')
source=("git://github.com/lisa-lab/pylearn2.git")
md5sums=('SKIP')

build() {
  cd pylearn2

  python2 setup.py build
}

package() {
  cd pylearn2

  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
