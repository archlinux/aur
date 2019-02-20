# Maintainer: wenbushi <wenbushi@gmail.com>
# Contributor: Carl George <carl at george dot computer>

pkgbase=('python-pdir2')
pkgname=('python-pdir2')
_module='pdir2'
pkgver='0.3.1.post2'
pkgrel=1
pkgdesc="Pretty dir() printing with joy"
url="https://github.com/laike9m/pdir2"
depends=('python>=3.5')
makedepends=('python-pip')
provides=("${pkgname}=${pkgver}")
license=('MIT')
arch=('any')
_wheel="${_module}-${pkgver}-py2.py3-none-${arch}.whl"
source=("https://files.pythonhosted.org/packages/e8/11/f3d2b3fbceceb3c5f8401cfcbcee3b3f2d16d79a9333bde5996a083d5b04/$_wheel")
noextract=("$_wheel")
sha256sums=('71761d0fe879de2c91fc36ecdb9a7f20d059deee7d94d0f10c2dea2cca1c1929')


package() {
	  PIP_CONFIG_FILE=/dev/null pip install --compile --no-deps --ignore-installed --root="${pkgdir}" $_wheel
}
