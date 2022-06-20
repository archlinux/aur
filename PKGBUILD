# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Joshua Taillon <jat255 AT gmail DOT com>
#
pkgname=python-hyperspy-gui-traitsui
pkginst=hyperspy_gui_traitsui
pkgver=1.5.2
pkgrel=1
pkgdesc="traitsui (desktop) GUI elements for HyperSpy" 
arch=('any')
url="https://github.com/hyperspy/hyperspy_gui_traitsui"
license=('GPLv3')

depends=('python-hyperspy>=1.7.0'
         'python-traitsui>=6.1'
         'python-link-traits')

#optdepends=()

makedepends=('python-setuptools')

replaces=('hyperspy-gui-traitsui')
conflicts=('hyperspy-gui-traitsui')
provides=('hyperspy-gui-traitsui')

source=(https://github.com/hyperspy/hyperspy_gui_traitsui/archive/v$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkginst-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('118cb0c68ad49f3a8df5b77cf1c58ef7')
