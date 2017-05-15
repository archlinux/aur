# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=holoviews
pkgname=python-$_pkgname
pkgver=1.7.0
pkgrel=1
pkgdesc="Stop plotting your data - annotate your data and let it visualize itself."
arch=("any")
url="http://holoviews.org"
license=('BSD')
depends=('python-numpy' 'python-param')
options=(!emptydirs)
source=("https://pypi.python.org/packages/21/7c/3ca9474a368fcbe8b036de483fce06b2d3a83855c7d2320c9917c86b079c/holoviews-1.7.0.tar.gz")
md5sums=('9165dc1901b7ce9f5a849ae071c3a8b9')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
