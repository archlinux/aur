# Maintainer: M0Rf30

_pkgsrcname=txrudp
pkgname=python2-${_pkgsrcname}
pkgver=0.4.0
pkgrel=1
pkgdesc="A Twisted extension implementing RUDP"
url="https://pypi.python.org/pypi/txrudp"
license=("MIT")
arch=("any")
depends=('python2' 'python2-twisted')
source=("https://pypi.python.org/packages/py2/t/${_pkgsrcname}/txrudp-$pkgver-py2-none-any.whl")


package() {
  cd $srcdir/
  pip2 install txrudp-$pkgver-py2-none-any.whl --root $pkgdir
  rm -r $pkgdir/usr/lib/python2.7/site-packages/tests/ 
}

md5sums=('6368f5c978e6a6f214997f748341d576')
