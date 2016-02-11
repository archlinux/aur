# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
_pyname=pydeep
pkgname=('python2-pydeep')
makedepends=('python2')
pkgver=0.4
pkgrel=1
pkgdesc="bindings for ssdeep"
arch=('any')
url="https://github.com/kbandla/pydeep/"
license=('BSD')
source=("https://github.com/kbandla/$_pyname/archive/$pkgver.tar.gz")
sha512sums=('1560ee50d79b666fa6d40e156a44afcf323728191597ae719f8613abba416cd14d3b5b39796d935697cf8fd738ef59ef69c735329217050a06a427a15a78c5ad')

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python2 setup.py install -O1 --root=$pkgdir
}

# vim:set et sw=2 ts=2 tw=79:
