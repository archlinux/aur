# Maintainer: Your Name <youremail@domain.com>
_pkgname=autopep8
pkgname=python-autopep8
pkgver=1.2.4
pkgrel=1
pkgdesc="Automatically formats Python code to conform to the PEP 8 style guide."
arch=('any')
url="http://pypi.python.org/pypi/${_pkgname}/$pkgver"
license=('MIT')
groups=()
depends=('python')
makedepends=('python-distribute')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/hhatto/autopep8/archive/v${pkgver}.tar.gz")
md5sums=('0458db85159a9e1b45f3e71ce6c158da')

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
