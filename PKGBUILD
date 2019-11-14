# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=hyperspy-gui-ipywidgets
pkginst=hyperspy_gui_ipywidgets
pkgver=1.1.1
pkgrel=1
pkgdesc="ipywidgets GUI elements for HyperSpy" 
arch=('any')
url="https://github.com/hyperspy/hyperspy_gui_ipywidgets"
license=('GPLv3')

depends=('hyperspy' 'python-ipywidgets' 'hyperspy-link-traits')

#optdepends=()

makedepends=('python-setuptools')

provides=('hyperspy-gui-ipywidgets')
conflicts=('hyperspy-gui-ipywidgets')

source=(https://github.com/hyperspy/hyperspy_gui_ipywidgets/archive/v$pkgver.zip)
sha256sums=('78e20fd90795eaab1a79aaa98dddeaf24bb668b0b2787a477fafc07cb373a4f3')

package() {
  cd "$srcdir/$pkginst-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

