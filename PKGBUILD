# Maintainer: Konstantin Kogan <kostyalamer@yandex.ru>
# Contributor: Konstantin Kogan <kostyalamer@yandex.ru>
pkgname=wm_theme_club_lumen_blue
pkgver=1.0
pkgrel=1
pkgdesc="Theme for Window Maker"
arch=('i686' 'x86_64')
url="http://forum.russ2.com/index.php?showtopic=2899"
license=('GPL')
source=("http://altlinuxclub.ru/arhiv/wm_theme_club_lumen_blue.tar.gz")
md5sums=('c7e1a22435a9ef06703b2b155b35ca79')
depends=('windowmaker')
license=('GPL2')

package() {
  cd ${pkgname}
  mkdir -p "$pkgdir/usr/share/WindowMaker/Themes/wm_theme_club_lumen_blue.themed/"
  install -m644 * "$pkgdir/usr/share/WindowMaker/Themes/wm_theme_club_lumen_blue.themed/"
}


