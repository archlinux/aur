# Maintainer: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=eternallands-sound
pkgver=1.9.6.1
version=${pkgver}
pkgrel=1
pkgdesc="Sound effects files for Eternal Lands"
url="http://www.eternal-lands.com/"
depends=("eternallands>=${pkgver}")
makedepends=('unzip')
license=('custom:eternallands')
arch=('any')
changelog=eternallands-sound.changelog
source=("https://github.com/raduprv/Eternal-Lands/releases/download/${version}/eternallands-sound_${pkgver}.zip")
md5sums=('59e055a191fc58163ddab81ba5615d2a')

package()
{
  cd $srcdir

  mkdir -p $pkgdir/usr/share/eternallands
  cp -R sound $pkgdir/usr/share/eternallands/
}
