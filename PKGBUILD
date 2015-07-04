# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>
pkgname=selene-media-encoder
pkgver=2.2.4 # bzr revision 126
pkgrel=1
pkgdesc="A simple but powerful audio/video converter for many formats"
arch=(any)
url="http://teejeetech.blogspot.in/p/selene-media-encoder.html"
license=('GPL')
depends=('gtk3' 'json-glib' 'libgee06' 'libsoup' 'mediainfo' 'vala')
makedepends=('bzr')
source=('selene::bzr+https://code.launchpad.net/~teejee2008/selene/trunk#revision=126')
md5sums=('SKIP')

build() {
  cd "$srcdir/selene"
  make
}

package() {
  cd "$srcdir/selene"
  make DESTDIR="$pkgdir/" install
}
