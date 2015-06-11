# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: Melancholy_Dream <Melancholy_Dream@write.su>
pkgname=python2-pyvtk
pkgver=0.4.85
pkgrel=1
pkgdesc="tools for manipulating VTK files in Python"
arch=('any')
url="https://code.google.com/p/pyvtk/"
license=('GPL')
depends=('python2')
conflicts=('pyvtk')
source=(https://pypi.python.org/packages/source/P/PyVTK/PyVTK-$pkgver.tar.gz)
md5sums=('76c9d9a38fbc72e4e38a3eaf69f992ea')

package() {
    cd "$srcdir/PyVTK-$pkgver"

    python2 setup.py build
    python2 setup.py install --root=$pkgdir
}
