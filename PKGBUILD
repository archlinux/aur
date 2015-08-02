# Maintainer: Oliver Sherouse <oliver DOT sherouse AT gmail DOT com>
_pkgname=seaborn
pkgname=python-$_pkgname
pkgver=0.6.0
pkgrel=1
pkgdesc="Statistical data visualization"
arch=("any")
url="http://www.stanford.edu/~mwaskom/software/seaborn/index.html"
license=('BSD')
depends=('python-pandas' 'python-matplotlib' 'python-scipy')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/s/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('bc518f1f45dadb9deb2bb57ca3af3cad')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
