# Maintainer: M0Rf30

_pkgsrcname=txrudp
pkgname=python2-${_pkgsrcname}
pkgver=0.4.1
pkgrel=2
pkgdesc="A Twisted extension implementing RUDP"
url="https://pypi.python.org/pypi/txrudp"
license=("MIT")
arch=("any")
depends=('python2' 'python2-twisted')
source=("https://pypi.python.org/packages/py2/t/${_pkgsrcname}/txrudp-$pkgver-py2-none-any.whl")


package() {
  cd $srcdir/
  pip2 install -I txrudp-$pkgver-py2-none-any.whl --root $pkgdir --no-deps

  rm -r $pkgdir/usr/lib/python2.7/site-packages/tests/ 
}

md5sums=('5c08ce0e7f45161f39c52efdb3fc67be')
