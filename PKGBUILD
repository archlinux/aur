# Maintainer: Marvin Gülker <quintus at quintilianus point eu>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>

pkgname='mlmmj'
pkgver=1.2.19.0
pkgrel=1
pkgdesc='Mailing-list manager'
depends=('sh')
arch=('i686' 'x86_64')
url='http://mlmmj.org/'
license=('GPL')
source=("http://mlmmj.org/releases/$pkgname-$pkgver.tar.bz2")
sha256sums=('3bcd7f5a17234ef570836f043ea4aacfdaf47d542c4ad4cbe4b2293c3bdb3cde')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
