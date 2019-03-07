# Contributor: Timo Schmiade <the_isz@gmx.de>

pkgname=notipy
pkgver=0.2.3
pkgrel=0
pkgdesc="A minimalistic gtk3 notification daemon written in python."
arch=("any")
url="https://gitlab.com/the_isz/notipy"
license=("GPL")
provides=("notification-daemon")
depends=("python2-gobject" "gtk3" "dbus-python")
options=(!emptydirs)
source=("https://gitlab.com/the_isz/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=("39f1c6382034e5642796bf71e07a3ba4")

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 deployment/setup.py install --root="$pkgdir/" --optimize=1
}
