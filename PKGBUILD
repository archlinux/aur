# Maintainer: Your Name <youremail@domain.com>
_pkgname=autopep8
pkgname=python-autopep8
pkgver=1.1.1
pkgrel=1
pkgdesc="Automatically formats Python code to conform to the PEP 8 style guide."
arch=('any')
url="http://pypi.python.org/pypi/${_pkgname}/$pkgver"
license=('MIT')
groups=()
depends=('python' 'pep8-python3')
makedepends=('python-distribute')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://pypi.python.org/packages/source/a/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
md5sums=('e52f1a9a3df04d7706451a80345cf3ec')

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
