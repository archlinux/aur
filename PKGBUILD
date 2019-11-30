# Maintainer: Lorenz Steinert <lorenz AT steinerts DOT de>

pkgname=('python2-lazr-delegates')
_pkgbase='lazr.delegates'
pkgver=2.0.4
pkgrel=1
pkgdesc="Easily write objects that delegate behavior"
arch=(any)
url="https://launchpad.net/lazr.delegates"
license=('LGPL')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/l/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('dded302c7bfce579aad8d5e2f2e3672dc920cc8d91015a9045d7ab240ba2b6e5')
makedepends=('python2-setuptools')

package_python2-lazr-delegates() {
  depends=('python2' 'python2-setuptools' 'python2-zope-interface' 'python2-nose')
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
