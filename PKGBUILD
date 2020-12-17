# Maintainer: jose1711 <jose1711@gmail.com>

pkgname=xlite-bin
pkgver=2.0
pkgrel=1
pkgdesc="a multiplatform fully functioning softphone (binary only)"
arch=('i686' 'x86_64')
url="http://www.counterpath.net/x-lite"
license=('custom')
source=("https://www.dropbox.com/s/68ll5ine6uq7pcp/X-Lite_Install.tar.gz?dl=0" "xlite.desktop")
md5sums=('6041fa4b2c553407373e6020c55da4ae' 'de98459edd82d90dcb40ccc62a47c6b5')
depends_i686=('libstdc++5' 'libglade' 'pangox-compat')
depends_x86_64=('lib32-libstdc++5' 'lib32-libglade' 'lib32-pangox-compat')
replaces=('xlite_bin')
conflicts=('xlite_bin')

package() {
  cd $srcdir/xten-xlite
  install -D -m 755 xtensoftphone $pkgdir/usr/bin/xtensoftphone
  install -D -m 644 ../xlite.desktop \
  $pkgdir/usr/share/applications/xlite.desktop
}
