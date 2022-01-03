# Contributor: mutantmonkey <aur@mutantmonkey.in>
pkgname=python2-colorpy
pkgver=0.1.1
pkgrel=1
pkgdesc="Python package that can convert physical descriptions of light into RGB colors"
arch=('any')
url="http://markkness.net/colorpy/ColorPy.html"
license=('GPL')
depends=('python2' 'python2-numpy')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/99/fc/3f4908f7e643e4e912bacee899e4b11488486259e7fc5739feaab09520a8/colorpy-0.1.1.tar.gz")
sha256sums=('e400a7e879adc83c6098dde13cdd093723f3936778c245b1caf88f5f1411170d')

build() {
  cd "$srcdir/colorpy-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/colorpy-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}