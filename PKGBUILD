 
# Maintainer: Jeremy Pope <jpope at jpope dot org> PGP-Key: E00B4261
pkgname=breeze-amber-cursor-theme
pkgver=1.0
pkgrel=2
pkgdesc="Breeze Amber cursor theme."
arch=('any')
url="https://kver.wordpress.com/2015/01/09/curses-i-mean-cursors/"
license=('GPL')
source=("https://share.kde.org/public.php?service=files&t=3f558bd504f8365141f2ccaf0426c237&download")
makedepends=('unzip')

sha256sums=('61b488366e3b3d405a20cfc20102cbbca5ae30a72802e3f5ac1eb3804a372d96')

package() {
    cd $srcdir/Breeze_Amber
    install -d $pkgdir/usr/share/icons/Breeze_Amber
    cp -rf *   $pkgdir/usr/share/icons/Breeze_Amber
    chmod -R 644 $pkgdir/usr/share/icons/Breeze_Amber/*
    chmod 755 $pkgdir/usr/share/icons/Breeze_Amber
    chmod 755 $pkgdir/usr/share/icons/Breeze_Amber/cursors
}
