pkgname='skype4py'
pkgver=1.0.35
pkgrel=3
pkgdesc="Skype4py"
url="https://github.com/awahlig/skype4py"
license=('GPL3')
makedepends=('python-distribute')
depends=('python2' 'python2-dbus' 'dbus-glib' 'python2-gobject2')
arch=('any')
source=("https://github.com/awahlig/skype4py/archive/${pkgver}.tar.gz")

package() {
  cd "$srcdir/skype4py-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('b7f3e0f8a9cb9e1863ef5b15588e45bd')
sha1sums=('390750aa63b1989e1e4cfb4a0514b232c052fe4c')
sha256sums=('47b61664a47d29f3d5d4a3d6f01a7c5c13c1610767b6ed9e48c07439003533b8')
