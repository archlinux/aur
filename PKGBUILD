# Maintainer: Jeremy Pope <jpope at jpope dot org> PGP-Key: E00B4261
pkgname=breeze-blue-cursor-theme
pkgver=1.0
pkgrel=2
pkgdesc="Breeze Blue cursor theme."
arch=('any')
url="https://kver.wordpress.com/2015/01/09/curses-i-mean-cursors/"
license=('GPL')
source=("https://share.kde.org/public.php?service=files&t=cf72875d375d5a7746c921dc2d8d2499&download")
makedepends=('unzip')

sha256sums=('0ba7968e5915dea1ccff681f4afd4aa6da43e328bd33d2a559f8154fc9967254')

package() {
    cd $srcdir/Breeze_Blue
    install -d $pkgdir/usr/share/icons/Breeze_Blue
    cp -rf *   $pkgdir/usr/share/icons/Breeze_Blue
    chmod -R 644 $pkgdir/usr/share/icons/Breeze_Blue/*
    chmod 755 $pkgdir/usr/share/icons/Breeze_Blue
    chmod 755 $pkgdir/usr/share/icons/Breeze_Blue/cursors
}
