# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=xcursor-atto
pkgver=1
pkgrel=1
pkgdesc="A non-conventional circular cursor theme, built with pen and touch based input in mind"
arch=('any')
url="https://www.gnome-look.org/p/999542/"
license=('GPL')
depends=()
source=("https://dl.opendesktop.org/api/files/download/id/1460734305/167180-Atto-cursor.tar.gz")
md5sums=('b53e4df14519c675cf973f2f44257555')

package() {
cd ${srcdir}/Atto-cursor
install -dm755 ${pkgdir}/usr/share/icons/
cp -vR * ${pkgdir}/usr/share/icons/
}


