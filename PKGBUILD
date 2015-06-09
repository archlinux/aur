# Maintainer : Marcos Heredia <chelqo@gmail.com>

pkgname=cinnamon-applet-sysmenu
pkgver=0.1
pkgrel=1
pkgdesc="System menu, like in Ubuntu"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/33"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/6ZYT-9J9L-OTUU.zip")
md5sums=('d20ff7a5197e33b2d7e0584f3cd3ba7e')
_applet=sysmenu@tuxuls@gmail.com

build() {
  cd $srcdir/$_applet
  rm *~
}

package() {
  cd $srcdir/$_applet
  install -dpm755 $pkgdir/usr/share/cinnamon/applets/$_applet
  find * -type f -exec install -Dpm644 {} $pkgdir/usr/share/cinnamon/applets/$_applet/ \;
}
