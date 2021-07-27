# Maintainer:   LeSnake <dev.lesnake@posteo.de>

pkgname=libunique
pkgver=1.1.6
pkgrel=10
pkgdesc='Library for writing single instance applications for GTK3'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/Attic/LibUnique'
license=('GPL')
depends=('gtk3')
#conflicts=('libunique3')
source=(https://archive.artixlinux.org/packages/l/libunique/libunique-1.1.6-8-x86_64.pkg.tar.zst)
sha256sums=('762f66826c73fdf97810cc3e04579139f564be50f53a071cc3dfb90c7836c48a')

package(){
   mv $srcdir/usr $pkgdir/usr
   rm $srcdir/libunique-1.1.6-8-x86_64.pkg.tar.zst
}
