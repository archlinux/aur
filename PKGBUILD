# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: tochiro@no.spam.mail.berlios.de
# Contributor: Thor "Third3ye" <tredje0ye@gmail.com>

pkgname=aspell-nb
pkgver=0.50.1
pkgrel=1
pkgdesc='Norwegian Bokmål dictionary for aspell'
arch=('any')
url='http://aspell.net/'
license=('GPL')
depends=('aspell')
source=("ftp://ftp.gnu.org/gnu/aspell/dict/nb/$pkgname-$pkgver-0.tar.bz2")
sha256sums=('e7746e8b617b2df576c1172399544818084524504202b16c747f52db5e5d228a')

build() {
  cd "$pkgname-$pkgver-0"

  ./configure
  make
}

package() {
  cd "$pkgname-$pkgver-0"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
