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
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('8c33bbf69750f75a9240c8e9d6bbfb9b6db8c3c62f8527481df0d8bf8c6bbadb')

package() {
  cd "$srcdir/bundlewrap-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
