# Maintainer: GordonGR <gordongr@freemail.gr>

pkgname=gtk-theme-plasma-shock-bolt-fire
pkgver=1.5
pkgrel=1
pkgdesc="Black theme based on Dark Cold"
arch=('any')
url="http://xfce-look.org/content/show.php/Plasma+Bolt%2C+Fire%2C+Shock?content=158436"
license=('GPL')
depends=('gtk-xfce-engine' 'gtk-engines')
source=("https://www.dropbox.com/s/nc5qdwodp0c8lw7/themes.tar.gz")
md5sums=('66c79891dc8a7bab81d91f196b9aa461')


package() {
#  cd ${srcdir}/DarkCold-OriginalSeed-xfwm
install -d "${pkgdir}/usr/share/themes"
cd Themes/GTK-3.20
cp -R 'Plasma Bolt' ${pkgdir}/usr/share/themes
cp -R 'Plasma Fire' ${pkgdir}/usr/share/themes
cp -R 'Plasma Shock' ${pkgdir}/usr/share/themes
}
