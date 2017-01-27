# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-lazr-delegates' 'python2-lazr-delegates')
_pkgbase='lazr.delegates'
pkgver=2.0.3
pkgrel=1
pkgdesc="Easily write objects that delegate behavior"
arch=(any)
url="https://launchpad.net/lazr.delegates"
license=('LGPL')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/l/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('51c80d5ac2c1f8f4a8c75fa271646529c8a6393a0b088dab50fb62138d092ee9')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-lazr-delegates() {
  depends=('python' 'python-setuptools' 'python-zope-interface' 'python-nose')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-lazr-delegates() {
  depends=('python2' 'python2-setuptools' 'python2-zope-interface' 'python2-nose')
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
