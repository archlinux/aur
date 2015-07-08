# Maintainer: Emile Pesik <ristridin [at] gmail [dot] com>
# Contributor: Gtklocker <karanti.linux [at] googlemail.com>

pkgname=klassik-plasma-theme
pkgver=0.2
pkgrel=2
pkgdesc="A plasma theme for the KDE3 nostalgics, similar to KDE3's default style."
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-look.org/content/show.php/Klassik?content=117677"
depends=('kdelibs' 'kdebase-workspace')
source=(http://kde-look.org/CONTENT/content-files/117677-klassik.tar.gz)
md5sums=('8ae550b0ceddfa02a45bd3d142e56e08')

package() {
  cd $srcdir/klassik
  find . -type d -exec install -d {,${pkgdir}/usr/share/apps/desktoptheme/klassik/}{} \;
  find . -type f -exec install -D -m 644 {,${pkgdir}/usr/share/apps/desktoptheme/klassik/}{} \;
  }
