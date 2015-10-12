pkgname=lib32-qt5-xmlpatterns
pkgver=5.5.0
pkgrel=1
pkgdesc="32bit qt5-xmlpatterns"
arch=('x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL' 'FDL' 'custom')
depends=('qt5-xmlpatterns' 'lib32-qt5-base')

source=(https://www.archlinux.org/packages/extra/i686/qt5-xmlpatterns/download/#qt5-xmlpatterns-i686.pkg.tar.xz)
md5sums=('SKIP')
pkgver() {
        cat $srcdir/.PKGINFO | grep -oP '(?<=pkgver = )\d+\.\d+\.\d+'
}
package() {
	mkdir -p ${pkgdir}/usr/lib32
	cp -rPf ${srcdir}/usr/lib/lib* ${pkgdir}/usr/lib32
}
