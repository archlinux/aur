# Maintainer: Konstantin Kogan <kostyalamer@yandex.ru>
# Contributor: Konstantin Kogan <kostyalamer@yandex.ru>
pkgname=wm_theme_club_10
pkgver=1.0
pkgrel=1
pkgdesc="Theme for Window Maker"
arch=('i686' 'x86_64')
url="http://forum.russ2.com/index.php?showtopic=2899"
license=('GPL')
source=("http://altlinuxclub.ru/arhiv/wm_theme_club_10.tar.gz")
md5sums=('7c3f89459b75a1f58ab046b25bfd4b2f')
depends=('windowmaker')
license=('GPL2')

package() {
  cd ${pkgname}
  mkdir -p "$pkgdir/usr/share/WindowMaker/Themes/wm_theme_club_10.themed/"
  install -m644 * "$pkgdir/usr/share/WindowMaker/Themes/wm_theme_club_10.themed/"
}


