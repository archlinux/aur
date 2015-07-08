# Maintainer: Emile Pesik <emile [at] aerion [dot] co [dot] uk> 

pkgname=yakuake-skin-steampunk
pkgver=1.0
pkgrel=1
pkgdesc="SteampunK Yakuake skin. This item is a part of Steam-Powered Linux KDE theme set."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?content=158529"
license=('CCPL:by-sa')
depends=('yakuake')
source=(http://kde-look.org/CONTENT/content-files/158529-SteampunK.tar.gz)
md5sums=('208ac5480f61316d63008e06c9053f62')

package() {

  mkdir -p ${pkgdir}/usr/share/apps/yakuake/skins/
  cp -r ${srcdir}/SteampunK ${pkgdir}/usr/share/apps/yakuake/skins/

}

