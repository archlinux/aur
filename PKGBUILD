# Contributor: Timo Schmiade <the_isz@gmx.de>

pkgname=notipy
pkgver=0.2.2
pkgrel=2
pkgdesc="A minimalistic gtk3 notification daemon written in python."
arch=("any")
url="https://github.com/the-isz/notipy"
license=("GPL")
provides=("notification-daemon")
depends=("python2-gobject" "gtk3" "dbus-python")
options=(!emptydirs)
source=("https://github.com/the-isz/$pkgname/tarball/$pkgver")
md5sums=("d76a043e979f5ff0980e005b2f72104f")

package() {
  cd "$srcdir/the-isz-$pkgname-459a1d8"

  python2 deployment/setup.py install --root="$pkgdir/" --optimize=1
}
