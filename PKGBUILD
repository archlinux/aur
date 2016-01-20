# Maintainer: M0Rf30

_pkgsrcname=txrudp
pkgname=python2-${_pkgsrcname}
pkgver=0.5.1
pkgrel=1
pkgdesc="A Twisted extension implementing RUDP"
url="https://pypi.python.org/pypi/txrudp"
license=("MIT")
arch=("any")
depends=('python2' 'python2-twisted')
source=("https://pypi.python.org/packages/source/t/${_pkgsrcname}/txrudp-$pkgver.tar.gz")


package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python2 setup.py install --root $pkgdir
  rm -rf $pkgdir/usr/lib/python2.7/site-packages/tests/
}

md5sums=('a21fe7ba3fd595b89355f5392be049e5')
