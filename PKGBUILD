# Maintainer: David Manouchehri <d@32t.ca>

pkgname=pk2dft
pkgver=0.1b
pkgrel=2
pkgdesc="Modify PK2DeviceFile.dat files for pk2cmd"
url="http://dangerousprototypes.com/forum/viewtopic.php?f=56&t=5304"
arch=('i686' 'x86_64')
depends=('confuse')
optdepends=('pk2cmd')
license=('unknown')
source=("pk2dft.c::http://dangerousprototypes.com/forum/download/file.php?id=9936")
sha512sums=('ddf349ca2fdc41dc02412d35bdbd13f05f044d1cb1ee8b3e640b284208cbccd0c9ad02d19f9fbdfc62cd0e269ef959c395353746e08333d158667f9bcd93470c')

build() {
  cd $srcdir
  gcc pk2dft.c -lconfuse -o pk2dft
}
package() {
  mkdir -p $pkgdir/usr/bin/
  cp $srcdir/pk2dft $pkgdir/usr/bin/
}
