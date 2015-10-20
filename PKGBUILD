# Maintainer: FadeMind <fademind@gmail.com>

pkgname=gnome-shell-theme-aurora
pkgver=3.18.20151020
pkgrel=1
pkgdesc="Aurora GNOME Shell,GTK2,GTK3 theme"
arch=('any')
url="http://opendesktop.org/content/show.php?content=170523"
license=('GPL3')
depends=(gnome-{shell,themes-standard} gtk-{engines,engine-murrine} gdk-pixbuf2)
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("${pkgname}-${pkgver}.tar.gz::https://www.dropbox.com/s/4ik0pbbpsiqe4ci/Aurora-3.18.tar.gz?dl=1")
sha256sums=('d1bd260bd93ed6032cfe50a72dc5f69cca8bfaa962dba7e3da4630ebe5355f2e')

package() {
    install -dm755 ${pkgdir}/usr/share/themes
    cp -rf ${srcdir}/Aurora-3.18/* ${pkgdir}/usr/share/themes
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 
