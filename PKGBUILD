# Maintainer: M0Rf30

_pkgsrcname=txrudp
pkgname=python2-${_pkgsrcname}
pkgver=0.5.2
pkgrel=1
pkgdesc="A Twisted extension implementing RUDP"
url="https://pypi.python.org/pypi/txrudp"
license=("MIT")
arch=("any")
depends=('python2' 'python2-twisted' 'python2-protobuf')
source=("https://pypi.python.org/packages/d6/d9/2c41beed045ac2324973d685c49663cfea8fb8b9f60cb24b820647deed59/txrudp-$pkgver.tar.gz")

package() {
  cd $srcdir/${_pkgsrcname}-$pkgver

  python2 setup.py install --root $pkgdir
  rm -rf $pkgdir/usr/lib/python2.7/site-packages/tests/
}
md5sums=('65eb8c5a0d11bbc86493c79c0430ffcb')
