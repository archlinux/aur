# Maintainer: portaloffreedom

_pkgsrcname=padatious
pkgname=python-padatious
pkgver=0.4.0
pkgrel=1
pkgdesc="A neural network intent parser"
url=" http://github.com/MycroftAI/padatious"
license=("Apache2.0")
arch=("any")
depends=('python')
source=("https://pypi.python.org/packages/04/bb/940bbff7722580544956aad19751bfc7912e5bd58b4a9f373ad8a14c2d2d/$_pkgsrcname-$pkgver.tar.gz#md5=0e3482a08120250a41f13a3c69d9eb8d")
md5sums=('0e3482a08120250a41f13a3c69d9eb8d')

package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python3 setup.py install --root $pkgdir
}


