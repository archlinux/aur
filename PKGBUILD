# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
pkgname=python2-simpledaemon
pkgver=1.0.1
pkgrel=1
_libname=SimpleDaemon
pkgdesc="Provides a simple Daemon class to ease the process of forking a python application on Unix systems"
arch=(any)
url="http://bitbucket.org/donspaulding/simpledaemon/"
license=('MIT')
depends=(python2)
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)
md5sums=(10ab1ebe102ed17ed452c119cd4c5a1a)

build() {
  cd "$srcdir/$_libname-$pkgver"
  python2 setup.py install --root=$pkgdir
}
