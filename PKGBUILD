# Contributor: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
pkgname=python-bundlewrap
_pkgname=bundlewrap
pkgver=3.6.1
pkgrel=1
pkgdesc="Agent-less configuration management"
arch=('any')
url='https://bundlewrap.org/'
license=('GPLv3')
depends=('python-cryptography'
	 'python-jinja'
	 'python-mako'
	 'python-passlib'
	 'python-pyaml'
	 'python-requests'
	 'python-six')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/00/a6/677563dc39553b116b528c96d94e3e17ec1218d415e5337dc50f0ee924f4/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8c33bbf69750f75a9240c8e9d6bbfb9b6db8c3c62f8527481df0d8bf8c6bbadb')

package() {
  cd "$srcdir/bundlewrap-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
