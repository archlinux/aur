# Maintainer: M0Rf30

pkgname=python2-obelisk
pkgver=0.1.3
pkgrel=1
pkgdesc="Pure Python Obelisk + Bitcoin client side library"
arch=(any)
url="https://github.com/darkwallet/python-obelisk"
license=('GPL')
depends=('python2' 'python2-pyzmq' 'python2-ecdsa' 'python2-twisted')
source=(https://pypi.python.org/packages/source/p/python-obelisk/python-obelisk-${pkgver}.tar.gz)
conflicts=('python2-obelisk-git')
replaces=('python2-obelisk-git')

package(){
  cd python-obelisk-${pkgver}
  python2 setup.py install --root="$pkgdir"
}

md5sums=('3340c8e5a4b9918b9117fc66c64d95a4')
