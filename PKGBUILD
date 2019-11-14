# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=hyperspy-gui-traitsui
pkginst=hyperspy_gui_traitsui
pkgver=1.2
pkgrel=1
pkgdesc="traitsui GUI elements for HyperSpy" 
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
sha256sums=('8b40b846a7ad15e9e4f48243cab3b77ace94ce7b70889dcd21b96a0b4d8d2637')

package() {
#  cd "$srcdir/$pkginst-$pkgver"
  cd "$srcdir/$pkginst-master"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

