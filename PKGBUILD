# Maintainer: Iru Cai <mytbk920423@gmail.com>
pkgname=qqwry
pkgver=20150426
pkgrel=1
pkgdesc="IP to location data file qqwry.dat"
arch=('i686' 'x86_64')
url="http://www.cz88.net/"
license=('custom')
makedepends=('innoextract')
source=('http://update.cz88.net/soft/setup.zip')
md5sums=('SKIP')

build() {
  cd "$srcdir"

  innoextract setup.exe
}

package() {
  install -d "$pkgdir/usr/share/qqwry/"
  cp "$srcdir/app/qqwry.dat" "$pkgdir/usr/share/qqwry/"
}

# vim:set ts=2 sw=2 et:
