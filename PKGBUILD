# Maintainer: GordonGR <gordongr@freemail.gr>

pkgname=gtk-theme-plasma-shock-bolt-fire
pkgver=1.3
pkgrel=3
pkgdesc="Black theme based on Dark Cold"
arch=('any')
url="http://xfce-look.org/content/show.php/Plasma+Bolt%2C+Fire%2C+Shock?content=158436"
license=('GPL')
depends=('gtk-xfce-engine' 'gtk-engines')
source=("http://xfce-look.org/CONTENT/content-files/158436-plasma-tweaks-gtk3.11-next2.tar.gz")
md5sums=('622c32e0364ae4463a4b3a306bc7c665')

replaces=(plasma-xfce-theme)
conflicts=(plasma-xfce-theme)

package() {
#  cd ${srcdir}/DarkCold-OriginalSeed-xfwm
install -d "${pkgdir}/usr/share/themes"
cp -R 'Plasma Bolt' ${pkgdir}/usr/share/themes
cp -R 'Plasma Fire' ${pkgdir}/usr/share/themes
cp -R 'Plasma Shock' ${pkgdir}/usr/share/themes
}
