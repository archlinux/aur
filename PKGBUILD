# Zork III adventure game

# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=zork3
pkgver=1
pkgrel=12
pkgdesc="Zork III adventure game (for Infocom's z-code interpreter)"
url="http://infocom.elsewhere.org/scheyen/"
depends=('frotz-ncurses')
source=(${url}Download/$pkgname.zip
        ${url}Maps/zork3/legend.gif
        ${url}Maps/zork3/north.gif
        ${url}Maps/zork3/south.gif
        ${url}Maps/zork3/mirrorbox.gif
        ${url}Maps/zork3/royalmaze.gif
        ${url}Maps/zork3/rmlegend.gif
        zork3
        LICENSE)
md5sums=('c1a15e9c56267366fa54476baa6fb7d4'
         '7af8ddd64c22a37b6cd7292aa0034364'
         'aef65075af8772c014e11f67e15fcc72'
         '837c3accd2d8e799268f65a19f5d24bb'
         '9159e829aa6ec726a42e4ec5253d3f11'
         '507da33e25a115cb61c864eb3bf0fbc8'
         'fea74edbc21405f5aea4e014a8e905ef'
         'e05483269d8ad3e019808f598ece6abf'
         '0d52f90e8c314686da4d410581f2c8a6')
arch=('any')
license=('custom')

package() {
  cd $srcdir

  install -D -m644 DATA/ZORK3.DAT $pkgdir/usr/share/zork/$pkgname/ZORK3.DAT
  install -D -m644 legend.gif $pkgdir/usr/share/zork/$pkgname/maps/legend.gif
  install -m644 *.gif $pkgdir/usr/share/zork/$pkgname/maps/
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
