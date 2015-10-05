pkgname=python-language-check
_name=language-check
pkgver=0.7.2
pkgrel=2
pkgdesc="Checks grammar using LanguageTool."
url="https://github.com/myint/language-check"
depends=('python')
makedepends=('python')
optdepends=()
license=('GPL3')
arch=('any')
source=("https://pypi.python.org/packages/source/l/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('58faf02629511f1b3f9a165c8c0251ea01a36ba8574d063c11b573e5393ee4ad')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
