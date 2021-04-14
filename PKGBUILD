# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Joshua Taillon <jat255 AT gmail DOT com>
#
pkgname=python-hyperspy-gui-traitsui
pkginst=hyperspy_gui_traitsui
pkgver=1.4.0
pkgrel=1
pkgdesc="traitsui (desktop) GUI elements for HyperSpy" 
arch=('any')
url="https://github.com/hyperspy/hyperspy_gui_traitsui"
license=('GPLv3')

depends=('python-hyperspy'
         'python-traitsui'
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
md5sums=('64e4f4f710d5809274981bf3253dec39')
