# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=gnome-shell-theme-aurora
pkgver=3.18.20151219
pkgrel=1
pkgdesc="Aurora GNOME Shell,GTK2,GTK3 theme"
arch=('any')
url="http://opendesktop.org/content/show.php?content=170523"
license=('GPL3')
depends=(gnome-{shell,themes-standard} gtk-{engines,engine-murrine} gdk-pixbuf2)
optdepends=("gnome-tweak-tool: A tool to customize advanced GNOME 3 options.")
source=("${pkgname}-${pkgver}.tar.gz::https://www.dropbox.com/s/4ik0pbbpsiqe4ci/Aurora-3.18.tar.gz?dl=1")
sha256sums=('bae3d9c16ed37ad9e3a67a4d019d2e8bff70a7fadbf87a722c2a960d6fd56a4c')

package() {
    install -d ${pkgdir}/usr/share/themes
    cp -rf ${srcdir}/Aurora-3.18/* ${pkgdir}/usr/share/themes
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 
