# Contributor:  Kyle Meyer <kyle@kyleam.com>

pkgbase=python-brewer2mpl
pkgname=python-brewer2mpl
_libname=${pkgbase/python-/}
pkgver=1.4.1
pkgrel=1
pkgdesc='Connect colorbrewer2.org color maps to Python and matplotlib'
arch=('any')
url='https://github.com/jiffyclub/brewer2mpl/wiki'
license=('MIT')
source=("https://pypi.python.org/packages/source/b/brewer2mpl/brewer2mpl-$pkgver.tar.gz")
md5sums=('f8cd1fbb9f5d836a3a095b1ca9d58fc2')

package() {
  depends=('python')
  optdepends=('python-matplotlib: get matplotlib color maps')
  cd "$srcdir/$_libname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
