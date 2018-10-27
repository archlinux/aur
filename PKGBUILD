# Maintainer: Konstantin Kogan <kostyalamer@yandex.ru>
# Contributor: Konstantin Kogan <kostyalamer@yandex.ru>
pkgname=wm_theme_club_09
pkgver=1.0
pkgrel=1
pkgdesc="Theme for Window Maker"
arch=('i686' 'x86_64')
url="http://forum.russ2.com/index.php?showtopic=2899"
license=('GPL')
source=("http://altlinuxclub.ru/arhiv/wm_theme_club_09.tar.gz")
md5sums=('96d7bef12b02225eaf71c7df4c0fb5f4')
depends=('windowmaker')
license=('GPL2')

package() {
  cd ${pkgname}
  mkdir -p "$pkgdir/usr/share/WindowMaker/Themes/wm_theme_club_09.themed/"
  install -m644 * "$pkgdir/usr/share/WindowMaker/Themes/wm_theme_club_09.themed/"
}


