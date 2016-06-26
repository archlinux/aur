# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname="gtk-theme-ambiance-ds-blue-sb12"
pkgver=1.80
pkgrel=3
pkgdesc="A theme based on Ambiance (gtk2, gtk3, gnome-shell, metacity, unity)"
arch=(any)
url="http://gnome-look.org/content/show.php/Ambiance+DS+BlueSB12?content=154519"
license=('GPL')
depends=('gtk-engine-unico' 'gtk-engine-murrine')
conflicts=()
source=("154519-AmbianceDSBlueSB12.tar.gz::https://dl.opendesktop.org/api/files/download?id=1463709633")

md5sums=('9c48a637b85f104f379963d4a10059f0')
install=()

package() {
# 	bsdtar -xf ${srcdir}/ambiance_blue_theme_suite_by_satya164-d396ttt.zip
mkdir -p ${pkgdir}/usr/share/themes
cp -R ${srcdir}/Ambiance* ${pkgdir}/usr/share/themes/
cd ${pkgdir}/usr/share/themes/
find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \;
}
