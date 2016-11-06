# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=gtk-theme-plasma-shock-bolt-fire
pkgver=1.9
pkgrel=1
pkgdesc="Black theme based on Dark Cold"
arch=('any')
url="http://www.xfce-look.org/p/1157147/"
license=('GPL')
depends=('gtk-xfce-engine' 'gtk-engines')
source=("http://dl.opendesktop.org/api/files/download/id/1478042972/Plasma-nov-2016.tar.gz")
md5sums=('06a7a43623d14954120ddd85dea178ba')


package() {
  cd ${srcdir}
install -d "${pkgdir}/usr/share/themes"
#cd Themes/GTK-3.20
cp -R 'Plasma Bolt' ${pkgdir}/usr/share/themes
cp -R 'Plasma Fire' ${pkgdir}/usr/share/themes
cp -R 'Plasma Shock' ${pkgdir}/usr/share/themes
}
