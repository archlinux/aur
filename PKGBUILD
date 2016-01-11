# Maintainer: M0Rf30

_pkgsrcname=txrudp
pkgname=python2-${_pkgsrcname}
pkgver=0.5.0
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
}

md5sums=('a5ea5e2777fbfe2419158041400b80c8')
