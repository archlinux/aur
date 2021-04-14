# Maintainer: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=eternallands-sound
pkgver=1.9.5.9
version=${pkgver}-1
pkgrel=1
pkgdesc="Sound effects files for Eternal Lands"
url="http://www.eternal-lands.com/"
depends=("eternallands>=${pkgver}")
makedepends=('unzip')
license=('custom:eternallands')
arch=('any')
changelog=eternallands-sound.changelog
source=("https://github.com/raduprv/Eternal-Lands/releases/download/${version}/eternallands-sound_${pkgver}.zip")
md5sums=('b441ce65da967c937ac030f219fdd9ae')

package()
{
  cd $srcdir

  mkdir -p $pkgdir/usr/share/eternallands
  cp -R sound $pkgdir/usr/share/eternallands/
}
