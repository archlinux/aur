# Original Maintainer: Ashley The Catgirl <me@ashley.re>
# Current Maintainer: Guillaume Doré <guillaume@dore-net.fr>
# Last update: 13/10/11

pkgname=slim-theme-rainbowdash-archlinux
pkgver=1.0.0
pkgrel=1
pkgdesc="20% cooler SLiM theme."
arch=('i686' 'x86_64')
url="http://ashley.re/"
license=('custom:CC BY-SA 3.0')
depends=('slim')
install=rainbowarch.install
source=("panel.png" "background.png" "preview.png" "AUTHORS" "COPYING" "README" "TRADEMARKS" "slim.theme")

md5sums=('9d9dc7294688ea97f96989709dfb48e1' '1b7ceca87d4c8517c362c0ef7c1d1ac9' '24d358687195e354bef1b0a984c6692d' '4374defee8e1aae804aa8b8b93c43995' '60d88dd0dc93e744baa544e1415063db' '442b737413fc4f456b70ffe9b3368351' '9e63175bdd9ca8d45662023f98b319f8' '438a1dc2d61e7a74381d5e936dc01836')

package() {
	install -d ${pkgdir}/usr/share/slim/themes/rainbowdash-archlinux
  cp panel.png ${pkgdir}/usr/share/slim/themes/rainbowdash-archlinux/panel.png
  cp background.png ${pkgdir}/usr/share/slim/themes/rainbowdash-archlinux/background.png
  cp preview.png ${pkgdir}/usr/share/slim/themes/rainbowdash-archlinux/preview.png 
  cp AUTHORS ${pkgdir}/usr/share/slim/themes/rainbowdash-archlinux/AUTHORS 
  cp COPYING ${pkgdir}/usr/share/slim/themes/rainbowdash-archlinux/COPYING 
  cp README ${pkgdir}/usr/share/slim/themes/rainbowdash-archlinux/README 
  cp TRADEMARKS ${pkgdir}/usr/share/slim/themes/rainbowdash-archlinux/TRADEMARKS 
	cp slim.theme ${pkgdir}/usr/share/slim/themes/rainbowdash-archlinux/slim.theme
}
