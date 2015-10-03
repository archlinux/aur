# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=trackballs-music
pkgver=1.4
pkgrel=3
pkgdesc="Music for the game trackballs."
arch=('i686' 'x86_64')
license=('GPL')
url="http://trackballs.sourceforge.net/"
depends=('trackballs')
source=(http://downloads.sourceforge.net/sourceforge/trackballs/$pkgname-$pkgver.tar.bz2 )
md5sums=('3b459b7301fbf30375b4e281fdb4bdb2')

package() {
  cd ${srcdir}/$pkgname
  mkdir -p ${pkgdir}/usr/share/trackballs/music
  cp -R *.ogg fml.html GPL.txt README ${pkgdir}/usr/share/trackballs/music
}
