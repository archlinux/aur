pkgname=python312-pyyaml
pkgver=6.0.3
pkgrel=1
pkgdesc='Python YAML parser and emitter for Python 3.12'
arch=('x86_64')
url='https://pyyaml.org/wiki/PyYAML'
license=('MIT')
depends=('python312')
makedepends=('python312-installer')
source=("pyyaml-6.0.3-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl::https://files.pythonhosted.org/packages/8b/9d/b3589d3877982d4f2329302ef98a8026e7f4443c765c46cfecc8858c6b4b/pyyaml-6.0.3-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl")
sha256sums=('ba1cc08a7ccde2d2ec775841541641e4548226580ab850948cbfda66a1befcdc')

package() {
  python3.12 -m installer --destdir="$pkgdir" "$srcdir/pyyaml-6.0.3-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl"
}
