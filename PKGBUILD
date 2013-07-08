# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python2-colorpy
pkgver=0.1.0
pkgrel=2
pkgdesc="Python package that can convert physical descriptions of light into RGB colors"
arch=('any')
url="http://markkness.net/colorpy/ColorPy.html"
license=('GPL')
depends=('python2' 'python2-numpy')
options=(!emptydirs)
source=("http://markkness.net/colorpy/dist/colorpy-${pkgver}.tar.gz")
sha256sums=('6ffe5311a61d17aac76eec216fa66e959a41cdc4a627d418ee1bf0ada9a777fd')

package() {
  cd "$srcdir/colorpy-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
