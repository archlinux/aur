pkgname=python-language-check
_name=language-check
pkgver=1.1
pkgrel=3
pkgdesc="Checks grammar using LanguageTool."
url="https://github.com/myint/language-check"
depends=('python')
makedepends=('python')
optdepends=()
license=('GPL3')
arch=('any')
source=("https://pypi.python.org/packages/source/l/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('9b140fa9f0be4903ffc91e2342e77ef35596de837ebde25ac6dc066f54417fab')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
