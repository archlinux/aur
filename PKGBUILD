# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=holoviews
pkgname=python-$_pkgname
pkgver=1.13.4
pkgrel=1
pkgdesc="Stop plotting your data - annotate your data and let it visualize itself."
arch=("any")
url="http://holoviews.org"
license=('BSD')
depends=('python-numpy' 'python-param' 'python-pandas' 'python-panel' 'python-pyviz_comms')
makedepends=('python-pyct')
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/26/ee/874b92109ecb76d0b5a71edf50971c94db0c6717867d70e8c2e81a824872/holoviews-1.13.4.tar.gz')
sha256sums=('34dc09dfb557f79515a011a72b343daf31b5e5d67403a008dded59bab658267c')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
