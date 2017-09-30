# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=gtk-theme-plasma-shock-bolt-fire
pkgver=2.2
pkgrel=1
pkgdesc="Black theme based on Dark Cold"
arch=('any')
url="http://www.xfce-look.org/p/1157147/"
license=('GPL')
depends=('gtk-xfce-engine' 'gtk-engines')
source=("https://dl.opendesktop.org/api/files/download/id/1504844103/plasma-fix-09-2017.tar.gz")
#=("http://dl.opendesktop.org/api/files/download/id/1495125443/plasma-may-17.tar.gz")
md5sums=('ea330a8654a5f0ad6f1dd7641cda7180')

package() {
cd ${srcdir}
install -d "${pkgdir}/usr/share/themes"
#cd Themes/GTK-3.20
cp -R 'Plasma Bolt' ${pkgdir}/usr/share/themes
cp -R 'Plasma Fire' ${pkgdir}/usr/share/themes
cp -R 'Plasma Shock' ${pkgdir}/usr/share/themes
}
