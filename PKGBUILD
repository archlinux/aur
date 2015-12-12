# Maintainer: GordonGR <gordongr@freemail.gr>

pkgname=gtk-theme-plasma-shock-bolt-fire
pkgver=1.4
pkgrel=1
pkgdesc="Black theme based on Dark Cold"
arch=('any')
url="http://xfce-look.org/content/show.php/Plasma+Bolt%2C+Fire%2C+Shock?content=158436"
license=('GPL')
depends=('gtk-xfce-engine' 'gtk-engines')
source=("http://xfce-look.org/CONTENT/content-files/158436-Plasma-1.4.tar.gz")
md5sums=('3861b7d97e9e6cd6d6ebf3fee7082c45')

replaces=(plasma-xfce-theme)
conflicts=(plasma-xfce-theme)

package() {
#  cd ${srcdir}/DarkCold-OriginalSeed-xfwm
install -d "${pkgdir}/usr/share/themes"
cp -R 'Plasma Bolt' ${pkgdir}/usr/share/themes
cp -R 'Plasma Fire' ${pkgdir}/usr/share/themes
cp -R 'Plasma Shock' ${pkgdir}/usr/share/themes
}
