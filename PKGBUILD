# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: TheBenj <thebenj88 *AT* gmail *DOT* com>
# Contributor: Juliao Gesse Fernandes <juliao.gf *AT* gmail *DOT* com>

pkgname=uif2iso
pkgver=0.1.7c
pkgrel=2
pkgdesc='Tool for converting single/multi part UIF image files to ISO'
arch=('x86_64' 'i686')
url='http://aluigi.org/mytoolz.htm#uif2iso'
license=('GPL')
depends=('zlib')
source=("http://aluigi.altervista.org/mytoolz/${pkgname}.zip")
sha256sums=('b78dde3e8bc28559f73e2feb46d41c8f57b511ddbe25d63ada704ef8697528ec')

build() {
  make -C src
}

package() {
  make -C src prefix="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
