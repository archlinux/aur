# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-ipython-cluster-helper
_pkgname=${pkgname#python2-}
pkgver=0.3.0
pkgrel=1
pkgdesc="Quickly and easily parallelize Python functions using IPython on a cluster"
url="https://github.com/roryk/ipython-cluster-helper"
license="MIT"
depends=('ipython2' 'python2-netifaces')
makedepends=('python2-distribute')
arch=('any')
source=("https://pypi.python.org/packages/source/i/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('8b767d535b698c6a44e299e7bcc0d5bc')

package() {
  cd "$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 
}

