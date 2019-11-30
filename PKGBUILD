# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-lazr-config')
_pkgbase='lazr.config'
pkgver=2.2.2
pkgrel=1
pkgdesc="Is typically used to manage process configuration"
arch=(any)
url="https://launchpad.net/lazr.config"
license=('LGPL')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/l/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('cdb9a70dac4a76ca1ff3528d9eafe5414c6c69c1b92e7e84d3477ae85f6bb787')
makedepends=('python-setuptools')

package_python-lazr-config() {
  depends=('python' 'python-lazr-delegates' 'python-nose' 'python-setuptools'
  'python-zope-interface')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
