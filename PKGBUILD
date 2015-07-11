# Maintainer: Jeremy Pope <jpope at jpope dot org> PGP-Key: E00B4261
pkgname=breeze-red-cursor-theme
pkgver=1.0
pkgrel=2
pkgdesc="Breeze Red cursor theme."
arch=('any')
url="https://kver.wordpress.com/2015/01/09/curses-i-mean-cursors/"
license=('GPL')
source=("https://share.kde.org/public.php?service=files&t=67ff3ae466f4670a8edb25d2d67f3c7e&download")
makedepends=('unzip')

sha256sums=('8b952060fffffd0e704501dfb568779782517a649c897e7f5f5fff638a1b5b32')

package() {
    cd $srcdir/Breeze_Red
    install -d $pkgdir/usr/share/icons/Breeze_Red
    cp -rf *   $pkgdir/usr/share/icons/Breeze_Red
    chmod -R 644 $pkgdir/usr/share/icons/Breeze_Red/*
    chmod 755 $pkgdir/usr/share/icons/Breeze_Red
    chmod 755 $pkgdir/usr/share/icons/Breeze_Red/cursors
}
