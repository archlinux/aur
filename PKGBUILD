# Maintainer: Philippe Proulx <eeppeliteloop@gmail.com>
pkgname=delicolour
pkgver=1.1.0
pkgrel=1
pkgdesc="Colour finder utility (GUI)"
arch=('any')
url='https://github.com/eepp/delicolour'
license=('GPL3')
depends=('python' 'python-gobject' 'gtk3' 'python-colormath')
makedepends=('python-setuptools')
provides=('delicolour')
conflicts=('delicolour')
source=("https://github.com/eepp/delicolour/archive/v$pkgver.tar.gz")
md5sums=('7882b240043ebf10ed3139f69dfffd3f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
