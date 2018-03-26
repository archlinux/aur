# Maintainer: LLL2yu <lll2yu@protonmail.com>

_pkgbase=python-aalib
pkgname=python2-aalib
pkgver=0.3.2
pkgrel=1
pkgdesc="Python 2.x bindings for AAlib"
arch=('any')
url="http://jwilk.nfshost.com/software/python-aalib.html"
license=("GPL2")
depends=('python2' 'aalib' 'python2-imaging')
source=(https://github.com/jwilk/${_pkgbase}/archive/${pkgver}.tar.gz)
sha256sums=('60e94d381d453232ae688bc8ea7246feeab6d7211905bcf5277476607af3eb55')

package() {
  cd "$srcdir"/${_pkgbase}-$pkgver
  python2 setup.py install -O1 --root="$pkgdir"
}
