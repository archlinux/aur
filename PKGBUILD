# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=hyperspy-gui-traitsui
pkginst=hyperspy_gui_traitsui
pkgver=1.3.0
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
sha256sums=('e7faba57c336de803ef140de8b71fe97ad83698d440b97ae06f1e835a8e9e608')

package() {
#  cd "$srcdir/$pkginst-$pkgver"
  cd "$srcdir/$pkginst-master"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

