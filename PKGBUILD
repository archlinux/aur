# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname="gtk-theme-ambiance-ds-blue-sb12"
pkgver=2.51
pkgrel=1
pkgdesc="A theme based on Ambiance (gtk2, gtk3, gnome-shell, metacity, unity)"
arch=(any)
url="http://gnome-look.org/content/show.php/Ambiance+DS+BlueSB12?content=154519"
license=('GPL')
depends=('gtk-engine-unico' 'gtk-engine-murrine')
conflicts=()

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1524565560/s/f2f1386029187c0f9f5f19366d4790d5/t/1525529821/u/32657/AmbianceDSBlueSB12.tar.xz")
md5sums=('e323c4f2ca201634367e0bc40e8db409')
install=()

package() {
# 	bsdtar -xf ${srcdir}/ambiance_blue_theme_suite_by_satya164-d396ttt.zip
mkdir -p ${pkgdir}/usr/share/themes
cp -R ${srcdir}/Ambiance* ${pkgdir}/usr/share/themes/
cd ${pkgdir}/usr/share/themes/
find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \;
}
