# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-ipython-cluster-helper
_pkgname=${pkgname#python2-}
pkgver=0.5.1
pkgrel=1
pkgdesc="Quickly and easily parallelize Python functions using IPython on a cluster"
url="https://github.com/roryk/ipython-cluster-helper"
license=("MIT")
depends=('ipython2' 'python2-netifaces')
makedepends=('python2-distribute')
arch=('any')
source=("https://github.com/roryk/ipython-cluster-helper/archive/v$pkgver.tar.gz")
md5sums=('b2a86d06f24c82ecef5fc4e0f56d52f0')

package() {
  cd "$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 
}
