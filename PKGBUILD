# Maintainer: Greg Fitzgerald <gregf@hugops.pw>

pkgname=ushlex
pkgver=0.99
pkgrel=1
pkgdesc="Shlex is A lexical analyzer class for simple shell-like syntaxes."
arch=('any')
url="https://pypi.python.org/pypi/ushlex"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
source=("https://pypi.python.org/packages/source/u/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('c5cfc04ab725cf4ed898d7e33e53bbca6e1122168a67aa795bb6299cc05a8904e3fc1ccef44b1ec9210d75885216c335889b9f158493a63107e0ea6eaa1ef4c6')

build() {
	cd $srcdir/${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
	cd $srcdir/${pkgname}-${pkgver}
	python2 setup.py install --root="$pkgdir" --optimize=1
}

