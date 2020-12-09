# Maintainer: wenbushi <wenbushi@gmail.com>
# Contributor: Carl George <carl at george dot computer>

pkgbase='python-pdir2'
pkgname='python-pdir2'
_module='pdir2'
pkgver='0.3.2'
pkgrel=1
pkgdesc="Pretty dir() printing with joy"
url="https://github.com/laike9m/pdir2"
depends=('python>=3.5')
makedepends=('python-pip')
provides=("${pkgname}=${pkgver}")
license=('MIT')
arch=('any')
_wheel="${_module}-${pkgver}-py2.py3-none-${arch}.whl"
source=("https://files.pythonhosted.org/packages/25/df/78657e25574db75474ca898e49d0e892a70e82a3eea6221694323098901b/$_wheel")
noextract=("$_wheel")
sha256sums=('9d3300e1704df359102c3ce8f92bd615155e348258809954ac868932ee03cff3')

package() {
	  PIP_CONFIG_FILE=/dev/null pip install --compile --no-deps --ignore-installed --root="${pkgdir}" $_wheel
}
