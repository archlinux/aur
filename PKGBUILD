# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=eternallands-sound
pkgver=1.9.1
pkgrel=1
pkgdesc="Sound effects files for Eternal Lands"
url="http://www.eternal-lands.com/"
depends=('eternallands>=1.9.1')
makedepends=('unzip')
license=('custom:eternallands')
arch=('i686' 'x86_64')
source=('http://www.eternal-lands.com/sound/EL_sound_191.zip')
md5sums=('6547ad41d2e49f0217b0a28f0b3f6756')

build()
{
  cd $srcdir

  # Install sound effects files
  mkdir -p $pkgdir/usr/share/eternallands
  cp -R sound $pkgdir/usr/share/eternallands/
}
