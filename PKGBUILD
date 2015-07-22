pkgname=python-language-check
_name=language-check
pkgver=0.7.2
pkgrel=1
pkgdesc="Checks grammar using LanguageTool."
url="https://github.com/myint/language-check"
depends=('python')
makedepends=('python')
optdepends=()
license=('GPL3')
arch=('any')
source=("https://pypi.python.org/packages/source/l/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('2aa80d292dbe8edc4f045a8929ed1991')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
