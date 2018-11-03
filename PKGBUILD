# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=gtk-theme-plasma-shock-bolt-fire
pkgver=2.5
pkgrel=2
pkgdesc="Black theme based on Dark Cold"
arch=('any')
url="http://www.xfce-look.org/p/1157147/"
license=('GPL')
depends=('gtk-xfce-engine' 'gtk-engines')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

# "https://dl.opendesktop.org/api/files/downloadfile/id/1540830184/s/$_s/t/$_t/u//themes-oct-18-update2.tar.gz"
source=("https://dl.opendesktop.org/api/files/download/id/1540830184/s/b8421c9d331394fa4e483dbb688c1516/t/1541254980/u//themes-oct-18-update2.tar.gz")
md5sums=('493ad976c8ff9f6287d81822f620ef13')

package() {
cd ${srcdir}
install -d "${pkgdir}/usr/share/themes"
#cd Themes/GTK-3.20
cp -R 'Plasma Bolt' ${pkgdir}/usr/share/themes
cp -R 'Plasma Fire' ${pkgdir}/usr/share/themes
cp -R 'Plasma Shock' ${pkgdir}/usr/share/themes
}
