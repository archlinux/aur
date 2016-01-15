# Maintainer: M0Rf30

pkgname=python2-libbitcoinclient
pkgver=0.3.2
pkgrel=1
pkgdesc='Pure Python Obelisk + Bitcoin client side library'
arch=('any')
url='https://github.com/OpenBazaar/python-libbitcoinclient'
license=('AGPL')
depends=(python2-ecdsa python2-twisted python2-pyzmq)
makedepends=(python2-setuptools)
conflicts=(python2-obelisk)
replaces=(python2-obelisk)
source=("https://pypi.python.org/packages/source/p/python-libbitcoinclient/python-libbitcoinclient-$pkgver.tar.gz")

package() {
  cd "$srcdir/python-libbitcoinclient-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
}

md5sums=('f12101b3979023dbcce69ea7deda6a91')
