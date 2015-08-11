# Maintainer: Federico Damián <federicodamians@gmail.com>
#
# PKGBUILD for Vimix Icon Theme
#

pkgname=vimix-icon-theme
pkgdesc="Fresh and simple personality icon theme."
pkgver=0.2
pkgrel=1
arch=('any')
url="http://vinceliuice.deviantart.com/art/Vimix-icon-themes-530683384"
license=('GPLv3')
depends=('numix-circle-icon-theme-git' 'paper-icon-theme-git')
makedepends=('p7zip')
optdepends=()
source=('http://orig05.deviantart.net/5db4/f/2015/152/1/a/vimix_icon_themes_by_vinceliuice-d8rydx4.7z')
md5sums=('SKIP')

package() {

  install -d -m 755 "$pkgdir"/usr/share/icons/vimix
  install -d -m 755 "$pkgdir"/usr/share/icons/vimix-dark
  install -d -m 755 "$pkgdir"/usr/share/icons/vimix-light

  cd $srcdir/vimix
  cp -r . "$pkgdir"/usr/share/icons/vimix/
  cd $srcdir/vimix-dark
  cp -r . "$pkgdir"/usr/share/icons/vimix-dark/
  cd $srcdir/vimix-light
  cp -r . "$pkgdir"/usr/share/icons/vimix-light/

}
