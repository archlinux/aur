# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=hyperspy-gui-ipywidgets
pkginst=hyperspy_gui_ipywidgets
pkgver=1.2
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

#source=(https://github.com/hyperspy/hyperspy_gui_ipywidgets/archive/v$pkgver.zi>
source=(https://github.com/hyperspy/hyperspy_gui_ipywidgets/archive/master.zip)
sha256sums=('1c672cce0f3a7bf1d4707de564966973428c11beb59c74947c3302acddf54ecb')

package() {
#  cd "$srcdir/$pkginst-$pkgver"
  cd "$srcdir/$pkginst-master"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

