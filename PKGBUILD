# Maintainer: Timo Wilken <timo dot 21 dot wilken plus aur at gmail dot com>
pkgname=gsegyview-bin
pkgver=0.2
pkgrel=1
pkgdesc='SEG-Y seismic data file viewer'
arch=('x86_64')
url='https://sourceforge.net/projects/gsegyview/files/gsegyview/GSEGYView%200.2/'
license=('GPL2')
depends=('lib32-gtkglext')
source=("gsegyview_${pkgver}_i386.deb::https://downloads.sourceforge.net/project/gsegyview/gsegyview/GSEGYView%20$pkgver/gsegyview_${pkgver}_i386.deb?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fgsegyview%2Ffiles%2Fgsegyview%2FGSEGYView%2520$pkgver%2Fgsegyview_${pkgver}_i386.deb%2Fdownload&ts=$(date +%s)")
sha256sums=('5b061095f8a97096870aaeb41ba9a2c6398f00491f9b2452f034a6a72d2a68bb')

package() {
    tar xzf "$srcdir/data.tar.gz"
    mv usr "$pkgdir"
}
