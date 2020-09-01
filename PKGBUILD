# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-hyperspy-gui-traitsui
pkginst=python-hyperspy_gui_traitsui
pkgver=1.3.0
pkgrel=1
pkgdesc="traitsui GUI elements for HyperSpy" 
arch=('any')
url="https://github.com/hyperspy/hyperspy_gui_traitsui"
license=('GPLv3')

depends=('python-hyperspy' 'python-traitsui' 'python-link-traits')

#optdepends=()

makedepends=('python-setuptools')

provides=('python-hyperspy-gui-traitsui')
replaces=('hyperspy-gui-traitsui')
conflicts=('python-hyperspy-gui-traitsui')

#source=(https://github.com/hyperspy/hyperspy_gui_traitsui/archive/v$pkgver.zip)
source=(https://github.com/hyperspy/hyperspy_gui_traitsui/archive/master.zip)
sha256sums=('997ec6218a6d764347125d5661f6b794a267d130427e9aadc039565037c1c667')

package() {
#  cd "$srcdir/$pkginst-$pkgver"
  cd "$srcdir/$pkginst-master"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

