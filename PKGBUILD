# Maintainer: M0Rf30

pkgname=python2-pystun
pkgver=0.1.0
pkgrel=2
pkgdesc="A Python STUN client for getting NAT type and external IP"
arch=(any)
url="http://github.com/jtriley/pystun"
license=('MIT')
depends=('python2' 'python2-pyzmq' 'python2-ecdsa' 'python2-twisted')
source=(https://pypi.python.org/packages/source/p/pystun/pystun-${pkgver}.tar.gz)

package(){
  cd pystun-${pkgver}
  python2 setup.py install --root="$pkgdir"
  rm -r "$pkgdir/usr/lib/python2.7/site-packages/tests"
}


md5sums=('5cefad003e24b1aa04577ddf21a65779')
