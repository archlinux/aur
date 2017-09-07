# Maintainer: levinit <levinit@outlook.com>

pkgname=grub-themes-stylishdark
pkgver=1.0
pkgrel=1
pkgdesc='stylishdark grub2 theme'
arch=(any)
url='https://www.gnome-look.org/p/1009237/'
license=('GPL')
depends=('grub')

source=('https://dl.opendesktop.org/api/files/download/id/1503588288/grub-themes-stylishdark.tar.xz')
md5sums=('SKIP')

package() {
    mv $srcdir/${pkgname}_${pkgver}-${pkgrel}_all $srcdir/$pkgname
    rm -r $srcdir/$pkgname/DEBIAN
    cp -r $srcdir/$pkgname/boot $pkgdir/
}
