# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-lazr-delegates')
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
makedepends=('python-setuptools')

package_python-lazr-delegates() {
  depends=('python' 'python-setuptools' 'python-zope-interface' 'python-nose')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
