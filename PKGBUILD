# Maintainer: dringsim <dringsim@qq.com>

pkgname=electronics-menus
pkgver=1.0
pkgrel=1
pkgdesc="Electronics (specific) XDG-compliant menu"
arch=('any')
url="http://www.archlinux.org/"
license=('GPL-2.0-or-later')
#depends=('desktop-file-utils')
#install=$pkgname.install
source=(transistor.png
	Electronics.directory
        electronics.menu)

package() {
  cd $srcdir

  mkdir -p $pkgdir/usr/share/desktop-directories
  mkdir -p $pkgdir/usr/share/pixmaps/electronics-menus
  mkdir -p $pkgdir/etc/xdg/menus/applications-merged
  mkdir -p $pkgdir/etc/xdg/menus/kde-applications-merged

  install -m644 *.directory $pkgdir/usr/share/desktop-directories/
  install -m644 *.png $pkgdir/usr/share/pixmaps/electronics-menus
  install -m644 *.menu $pkgdir/etc/xdg/menus/applications-merged/
  install -m644 *.menu $pkgdir/etc/xdg/menus/kde-applications-merged/
}

sha256sums=('4b66371555a422095bdabe41244d4c142dd73725156297b1236d19b385a9ac2e'
            'a14a33b9485456f8d6d96c4df3e8a71f5c98dbe3cf68eff94c080890173ed4df'
            'cc9361a04e706d3d0295fbea8868d0d6cb54702232a420026e25f5d26b5e985e')
