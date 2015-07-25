pkgname=python-pyvtk
pkgver=0.4.85
pkgrel=1
pkgdesc="Tools for manipulating VTK files in Python"
arch=('any')
url="https://code.google.com/p/pyvtk/"
license=('GPL')
depends=('python')
conflicts=('pyvtk')
source=(https://pypi.python.org/packages/source/P/PyVTK/PyVTK-$pkgver.tar.gz)
sha256sums=('4f971e21eb73b44fd4dd52bed1aeea7879e0d9e8debfded651bb8fc9c80033e2')

build(){
    cd "$srcdir/PyVTK-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/PyVTK-$pkgver"
    python2 setup.py install --root=$pkgdir --optimize=1
}

