# Maintainer: Antonio Rojas < arojas@archlinux.org >
# Contributor: Jan Valiska <jan.valiska@gmail.com>

pkgname=kde-servicemenus-rootactions
pkgver=2.8.5
pkgrel=1
pkgdesc="Allows admin users to perform several root only actions from dolphin via kdesu/kdesudo"
arch=(any)
url="http://www.kde-apps.org/content/show.php?content=48411"
license=(GPL)
depends=(kdebase-dolphin kdebase-kdialog kdeutils-ark)
source=("http://www.kde-apps.org/CONTENT/content-files/48411-rootactions_servicemenu_$pkgver.tar.gz")
md5sums=('ee2546b270187de2f06b9e62b2e20883')

package() {
cd $srcdir/rootactions_servicemenu_$pkgver/Root_Actions_$pkgver/dolphin-KDE4/
mkdir -p $pkgdir/usr/share/kde4/services/ServiceMenus/
install -m755 *.desktop $pkgdir/usr/share/kde4/services/ServiceMenus/
cd $srcdir/rootactions_servicemenu_$pkgver/Root_Actions_$pkgver 
install -Dm755 rootactions-servicemenu.pl $pkgdir/usr/bin/rootactions-servicemenu.pl
} 
