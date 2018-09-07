# Maintainer: Doron Behar <doron.behar@gmail.com>
# Contributer: <stormdragon2976@gmail.com>
# Contributer: Ondrej Kipila <ok100@openmailbox.org>

pkgname=lyvi
pkgver=2.0.0
pkgrel=1
pkgdesc="Command-line lyrics, guitar tabs, and artist information viewer"
url="https://ok100.github.io/lyvi/"
arch=(any)
license=('WTFPLv2')
depends=('python-glyr' 'python-pillow' 'python-psutil' 'python-urwid')
optdepends=('python-dbus: mpris support'
            'python-gobject: mpris support')
makedepends=('python-pip')
source=("https://github.com/ok100/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('8c85fc43b8f7f225fd4231801762a6bb')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
