# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-hyperspy-gui-ipywidgets
pkginst=hyperspy_gui_ipywidgets
pkgver=1.3.0
pkgrel=1
pkgdesc="ipywidgets GUI elements for HyperSpy" 
arch=('any')
url="https://github.com/hyperspy/hyperspy_gui_ipywidgets"
license=('GPLv3')

depends=('python-hyperspy' 'python-ipywidgets' 'python-link-traits')

#optdepends=()

makedepends=('python-setuptools')

replaces=('hyperspy-gui-ipywidgets')

#source=(https://github.com/hyperspy/hyperspy_gui_ipywidgets/archive/v$pkgver.zi>
source=(https://github.com/hyperspy/hyperspy_gui_ipywidgets/archive/master.zip)
sha256sums=('f3d45883b2c944a572241af889ff4e53837e478b87ecd93ad416b0b7e8085799')

package() {
#  cd "$srcdir/$pkginst-$pkgver"
  cd "$srcdir/$pkginst-master"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

