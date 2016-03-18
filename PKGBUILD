# Maintainer: Paulo Castro <p.oliveira.castro@gmail.com>
pkgname=python-fiona
pkgver=1.6.3
pkgrel=1
pkgdesc="Reads and writes spatial data files"
arch=('any')
url="https://github.com/Toblerity/Fiona"
license=('BSD')
depends=('python' 'python-six' 'python-cligj' 'gdal')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/F/Fiona/Fiona-1.6.3.tar.gz")
md5sums=('f6b70e1a30fc8db597c360e375d186de')

package() {
  cd "$srcdir/Fiona-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
