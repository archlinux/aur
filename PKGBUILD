pkgname=mingw-w64-python310-numpy-bin
pkgver=1.23.0
pkgrel=1
pkgdesc="Scientific tools for Python (mingw-w64)"
arch=('any')
license=('custom')
url="https://www.numpy.org/"
depends=('mingw-w64-python310-bin')
options=('staticlibs' '!buildflags' '!strip')
source=("https://files.pythonhosted.org/packages/34/1c/1c9ec57f522822e7507fb5cf69b153f857405518d8f50fa4ff94f43385be/numpy-1.23.0-cp310-cp310-win_amd64.whl")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir"/usr/x86_64-w64-mingw32/lib/python310/
  cp -r $srcdir/numpy* "$pkgdir"/usr/x86_64-w64-mingw32/lib/python310/
}

