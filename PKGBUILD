# Maintainer: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: Immae <ismael.bouya@normalesup.org>
# Contributor: Nayden Pendov <darkwolf1984@gmail.com>

pkgname=eternallands-music
pkgver=1.9.5.9
version=${pkgver}-1
pkgrel=1
pkgdesc="Music files for Eternal Lands"
url="http://www.eternal-lands.com/"
depends=("eternallands>=${pkgver}")
makedepends=('unzip')
license=('custom:eternallands')
arch=('any')
source=("https://github.com/raduprv/Eternal-Lands/releases/download/${version}/eternallands-music_${pkgver}.zip")
md5sums=('95220e0df0be0eb4f2b9646cc5d6b7e5')

package()
{
  cd $srcdir
  mkdir -p music
  mv *.ogg *.pll music/

  mkdir -p $pkgdir/usr/share/eternallands
  cp -R music $pkgdir/usr/share/eternallands/
}

