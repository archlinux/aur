# Maintainer: Albert Kugel (Lastebil) (lastebilaur@trebel.org)
# Contributor: MariHahn (don't contact me)

pkgname=xcursor-green-apparatus
pkgver=0.7.3
pkgrel=1
pkgdesc="Green (Blue, Red, and Yellow) Apparatus X Cursor Theme"
url="http://s0ury.deviantart.com/art/J-Aroche-s-G-A-Converted-88491633"
depends=('libxcursor')
license=('GPL')
arch=(i686 x86_64)
source=(http://fc02.deviantart.net/fs30/f/2008/164/0/1/J_Aroche__s_G_A__Converted_by_s0ury.zip)

md5sums=('6d59a65d1d84f68ba458932c41291b29')

package() {
  mkdir -p "$pkgdir/usr/share/icons"

  tar -xzf "$srcdir/RedApparatus.tar.gz"
  tar -xzf "$srcdir/GreenApparatus.tar.gz"
  tar -xzf "$srcdir/BlueApparatus.tar.gz"
  tar -xzf "$srcdir/YellowApparatus2.tar.gz"

  cp -r \
  "$srcdir/RedApparatus" \
  "$srcdir/GreenApparatus" \
  "$srcdir/BlueApparatus" \
  "$srcdir/YellowApparatus2" \
  "$pkgdir/usr/share/icons"
}
