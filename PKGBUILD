# Maintainer: Konstantin Kogan <kostyalamer@yandex.ru>
# Contributor: Konstantin Kogan <kostyalamer@yandex.ru>
pkgname=wm_theme_club_02
pkgver=1.0
pkgrel=1
pkgdesc="Theme for Window Maker"
arch=('i686' 'x86_64')
url="http://forum.russ2.com/index.php?showtopic=2899"
license=('GPL')
source=("http://altlinuxclub.ru/arhiv/wm_theme_club_02.tar.gz")
md5sums=('47f2e152bbd35e798e3619c15388074f')
depends=('windowmaker')
license=('GPL2')

package() {
  cd ${pkgname}
  mkdir -p "$pkgdir/usr/share/WindowMaker/Themes/wm_theme_club_02.themed/"
  install -m644 * "$pkgdir/usr/share/WindowMaker/Themes/wm_theme_club_02.themed/"
}


