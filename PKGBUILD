# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-lazr-config')
_pkgbase='lazr.config'
pkgver=2.1
pkgrel=1
pkgdesc="Is typically used to manage process configuration"
arch=(any)
url="https://launchpad.net/lazr.config"
license=('LGPL')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/l/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('5f380f5defd1f2e0db7483f5b55072e458dcba1d38ea8b2c7867de8127970689')
makedepends=('python-setuptools')

package_python-lazr-config() {
  depends=('python' 'python-lazr-delegates' 'python-nose' 'python-setuptools'
  'python-zope-interface')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
