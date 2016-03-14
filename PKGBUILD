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
  cd "$srcdir/Skype4Py-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('d2b8ce24bae917c66f0b86a2fa7963cb')
sha1sums=('f556affe7977bfc0a39dd897dc6a334a29064e4e')
sha256sums=('6cb4ac615ba1c8a2b0bf4d82d1423a7634a722d1d663b2a6c79fe095f6f95eec')
