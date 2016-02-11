# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python-pymisp
_pyname=PyMISP
pkgname=('python-pymisp' 'python2-pymisp')
makedepends=('python' 'python2')
pkgver=2.2
pkgrel=1
pkgdesc="API for MISP."
arch=('any')
url="https://github.com/MISP/PyMISP/"
license=('BSD2')
source=("https://github.com/MISP/PyMISP/archive/v$pkgver.tar.gz")
sha512sums=('125e9251acb832b2c63bb08f1a9f17e22ee155a21d5f97cc642a046c7c5ebe4a457ba7cd635ca196f20607b446ea2716b3ef73d9e2b81d05446700a830bca04c')

package_python-pymisp() {
  depends=('python')
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install -O1 --root=$pkgdir

}

package_python2-pymisp() {
  depends=('python2')
  cd "$srcdir/$_pyname-$pkgver"
  python2 setup.py install -O1 --root=$pkgdir

}

# vim:set et sw=2 ts=2 tw=79:
