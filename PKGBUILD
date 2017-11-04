# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname="gtk-theme-ambiance-ds-blue-sb12"
pkgver=2.50
pkgrel=1
pkgdesc="A theme based on Ambiance (gtk2, gtk3, gnome-shell, metacity, unity)"
arch=(any)
url="http://gnome-look.org/content/show.php/Ambiance+DS+BlueSB12?content=154519"
license=('GPL')
depends=('gtk-engine-unico' 'gtk-engine-murrine')
conflicts=()
source=("https://dl.opendesktop.org/api/files/download/id/1507105313/AmbianceDSBlueSB12.tar.xz")
md5sums=('ecf3ebf5f86a191e21fcd629ffcee775')
install=()

package() {
# 	bsdtar -xf ${srcdir}/ambiance_blue_theme_suite_by_satya164-d396ttt.zip
mkdir -p ${pkgdir}/usr/share/themes
cp -R ${srcdir}/Ambiance* ${pkgdir}/usr/share/themes/
cd ${pkgdir}/usr/share/themes/
find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \;
}
