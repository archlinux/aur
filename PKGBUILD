# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=holoviews
pkgname=python-$_pkgname
pkgver=1.12.5
pkgrel=1
pkgdesc="Stop plotting your data - annotate your data and let it visualize itself."
arch=("any")
url="http://holoviews.org"
license=('BSD')
depends=('python-numpy' 'python-param' 'python-pyviz_comms')
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/58/d8/7bd7552e09604819efea0cbd1988d7f1bcaec150ab440254e3f4d988ee3c/holoviews-1.12.5.tar.gz')
sha256sums=('7c3c68e503b7bc5d4d7a24dc5466c9511f84d13a034748b4201973689df08a95')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
