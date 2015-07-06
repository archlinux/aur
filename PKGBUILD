# Maintainer: Boohbah <boohbah at gmail.com>

pkgname=trinity
pkgver=1.5
pkgrel=1
pkgdesc="A Linux System call fuzz tester"
arch=('i686' 'x86_64')
url="http://codemonkey.org.uk/projects/trinity/"
license=('GPL')
source=("http://codemonkey.org.uk/projects/trinity/$pkgname-$pkgver.tar.xz")
md5sums=('79ed682dd0f31fc4bdef4b77919759fa')

build() {
  cd "$pkgname-$pkgver"
  ./configure.sh
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
