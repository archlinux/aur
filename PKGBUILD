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
md5sums=('95220e0df0be0eb4f2b9646cc5d6b7e5')

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

