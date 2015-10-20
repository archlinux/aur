# Maintainer: FadeMind <fademind@gmail.com>

pkgname=gnome-shell-theme-aurora
pkgver=3.18.20151020
pkgrel=2
pkgdesc="Aurora GNOME Shell,GTK2,GTK3 theme"
arch=('any')
url="http://opendesktop.org/content/show.php?content=170523"
license=('GPL3')
depends=(gnome-{shell,themes-standard} gtk-{engines,engine-murrine} gdk-pixbuf2)
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("${pkgname}-${pkgver}.tar.gz::https://www.dropbox.com/s/4ik0pbbpsiqe4ci/Aurora-3.18.tar.gz?dl=1")
sha256sums=('e937877632156ca0f9affaf35b10fa5eb831f441166a7c7b9439ffe01c3ff003')

package() {
    install -dm755 ${pkgdir}/usr/share/themes
    cp -rf ${srcdir}/Aurora-3.18/* ${pkgdir}/usr/share/themes
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 
