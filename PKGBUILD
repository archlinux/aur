# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Joshua Taillon <jat255 AT gmail DOT com>
#
pkgname=python-hyperspy-gui-ipywidgets
pkginst=hyperspy_gui_ipywidgets
pkgver=1.4.0
pkgrel=1
pkgdesc="ipywidgets (jupyter) GUI elements for HyperSpy" 
arch=('any')
url="https://github.com/hyperspy/hyperspy_gui_ipywidgets"
license=('GPLv3')

depends=('python-hyperspy'
         'python-ipywidgets'
         'python-link-traits')

#optdepends=()

makedepends=('python-setuptools')

replaces=('hyperspy-gui-ipywidgets')
conflicts=('hyperspy-gui-ipywidgets')
provides=('hyperspy-gui-ipywidgets')

source=(https://github.com/hyperspy/hyperspy_gui_ipywidgets/archive/v$pkgver.tar.gz)
sha256sums=('d848142733f00c7e9b54c25ac1ea48da5ca509eae55ba019f6cff97c60140c29')

package() {
  cd "$srcdir/$pkginst-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
