# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=music-file-organizer
pkgver=1.0.1
pkgrel=1
pkgdesc="Command-line audio file organizer that reads tags and renames files."
url="http://git.zx2c4.com/music-file-organizer/about/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('icu' 'taglib')
source=(http://git.zx2c4.com/$pkgname/snapshot/$pkgname-$pkgver.tar.xz)
sha1sums=('4afbd58c47af4472ea50da383cdca564a5bb0d2d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
