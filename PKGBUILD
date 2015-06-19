# Contributor: dieghen89 <dieghen89 at gmail dot com>
pkgname=yakuake-skin-ethais
pkgver=0.2
pkgrel=1
pkgdesc="An oxygen-style theme for Yakuake"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Yakuake+Ethais+KDE4?content=129282"
license=('LGPL')
depends=('yakuake')
source=(http://kde-look.org/CONTENT/content-files/129282-ethais.tar.gz)
md5sums=('e7b11e1885cac7ce33a1a9d60f974fd0')

package() {
mkdir -p ${pkgdir}/usr/share/apps/yakuake/skins/
cp -r ${srcdir}/ethais ${pkgdir}/usr/share/apps/yakuake/skins/
}
