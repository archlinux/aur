# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=gtk-theme-plasma-shock-bolt-fire
pkgver=2.3b
pkgrel=1
pkgdesc="Black theme based on Dark Cold"
arch=('any')
url="http://www.xfce-look.org/p/1157147/"
license=('GPL')
depends=('gtk-xfce-engine' 'gtk-engines')
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1514969245/s/fe5bf8c53268fd81925ee2cf831c531c/t/1517754616/u//themes-jan-2018-3.tar.gz")
md5sums=('8b7c25bb20b0a1f98e2106846ceaa9a5')

package() {
cd ${srcdir}
install -d "${pkgdir}/usr/share/themes"
#cd Themes/GTK-3.20
cp -R 'Plasma Bolt' ${pkgdir}/usr/share/themes
cp -R 'Plasma Fire' ${pkgdir}/usr/share/themes
cp -R 'Plasma Shock' ${pkgdir}/usr/share/themes
}
