# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Joshua Taillon <jat255 AT gmail DOT com>
#
pkgname=python-hyperspy-gui-ipywidgets
pkginst=hyperspy_gui_ipywidgets
pkgver=2.0
pkgrel=1
pkgdesc="ipywidgets (jupyter) GUI elements for HyperSpy" 
arch=('any')
url="https://github.com/hyperspy/hyperspy_gui_ipywidgets"
license=('GPLv3')

depends=('python-hyperspy>=2.0rc0'
         'python-ipywidgets>=7.0'
         'python-link-traits'
         )

#optdepends=()

makedepends=('python-setuptools')

replaces=('hyperspy-gui-ipywidgets')
conflicts=('hyperspy-gui-ipywidgets')
provides=('hyperspy-gui-ipywidgets')

source=(https://github.com/hyperspy/hyperspy_gui_ipywidgets/archive/v$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkginst-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('7bc2df8e1861d52c500129c31d706316')
