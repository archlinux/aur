# Maintainer: Allonsy <linuxbash8@gmail.com>
# Program Author Luigi Auriemma <me@aluigi.org>
pkgname=calcc
pkgver=0.1.5
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="useful command-line calculator (32/64 bit numbers)"
url="http://aluigi.org/mytoolz.htm#calcc"
license="Open Source"
depends=()
makedepends=('gcc')
conflicts=()
replaces=()
backup=()
install=
source=('http://aluigi.org/mytoolz/calcc.zip')
md5sums=('05da69e83f7e04f20c98bf4fd67b8ebf')

build() {
  make
}

package()
{
  make DESTDIR="$pkgdir/" install

}
