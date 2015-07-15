
# Contributor: Adria Arrufat <swiftscythe@gmail.com>

pkgname=pidgin-elementary-tray-icons
pkgver=1
pkgrel=1
pkgdesc="Pidgin elementary icon theme for system tray"
arch=('any')
url="http://xfce-look.org/content/show.php/Elementary+Tray+Icons+4+Pidgin?content=126339"
license=('GPL')
source=('http://xfce-look.org/CONTENT/content-files/126339-elementary-pidgin-tray.tar.bz2')
md5sums=('126c206bc8d18bf452c280813a375f01')
makedepends=()

build() {
  mkdir -p "$pkgdir/usr/share/pixmaps/pidgin/tray"
   
  cp -Rf $srcdir/tray/* "$pkgdir/usr/share/pixmaps/pidgin/tray"
}
