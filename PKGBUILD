pkgname="planetarysystemstacker-git"
_pkgname="planetarysystemstacker"
pkgver=0.8.31
pkgrel=1
pkgdesc="Produce a sharp image of a planetary system object"
arch=("x86_64")
depends=('python-opencv' 'python-astropy' 'python-scikit-image' 'python-numpy')
url='https://github.com/Rolf-Hempel/PlanetarySystemStacker'
license=('GPL3')
source=("$pkgname::git+https://github.com/Rolf-Hempel/PlanetarySystemStacker.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root=$pkgdir
}

