# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=hyperspy-gui-traitsui
pkginst=hyperspy_gui_traitsui
pkgver=1.3.0
pkgrel=1
pkgdesc="Replaced by python-hyperspy-gui-traitsui (traitsui GUI elements for HyperSpy)." 
arch=('any')
url="https://github.com/hyperspy/hyperspy_gui_traitsui"
license=('GPLv3')

depends=('hyperspy' 'python-traitsui' 'hyperspy-link-traits')

#optdepends=()

makedepends=('python-setuptools')

provides=('hyperspy-gui-traitsui')
conflicts=('hyperspy-gui-traitsui')

#source=(https://github.com/hyperspy/hyperspy_gui_traitsui/archive/v$pkgver.zip)
source=(https://github.com/hyperspy/hyperspy_gui_traitsui/archive/master.zip)
sha256sums=('997ec6218a6d764347125d5661f6b794a267d130427e9aadc039565037c1c667')

package() {
#  cd "$srcdir/$pkginst-$pkgver"
  cd "$srcdir/$pkginst-master"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

