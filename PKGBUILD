# Maintainer : Immae <ismael.bouya@normalesup.org>
# Contributor: Nayden Pendov <darkwolf1984@gmail.com>

pkgname=eternallands-music
pkgver=1.5.0
pkgrel=1
pkgdesc="Music files for Eternal Lands"
url="http://www.eternal-lands.com/"
depends=('eternallands>=1.5.0')
makedepends=('unzip')
license=('custom:eternallands')
arch=('i686' 'x86_64')
source=('http://www.gm.fh-koeln.de/~linke/EL-Downloads/EL_music_full.zip')
sha512sums=('dbd24cb20331d3640b3a5891faaf88aa0e71ba0564dfde347f2ea0fcb7e0f2700f1324ee8e988c551efb943183bbc823d4ee0373ed2b1f6d0300df76e25a524c')

package()
{
  cd $srcdir
  mkdir music
  mv *.ogg music/
  mv *.pll music/

  #Install music files
  mkdir -p $pkgdir/usr/share/eternallands
  cp -R music $pkgdir/usr/share/eternallands/
}

