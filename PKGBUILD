# Maintainer: Jeremy Pope <jpope at jpope dot org> PGP-Key: E00B4261
pkgname=breeze-blue-cursor-theme
pkgver=1.0
pkgrel=3
pkgdesc="Breeze Blue cursor theme."
arch=('any')
url="https://kver.wordpress.com/2015/01/09/curses-i-mean-cursors/"
license=('GPL')
source=("https://code.jpope.org/jpope/breeze_cursor_sources/raw/master/breeze-blue-cursor-theme.zip")
makedepends=('unzip')

sha256sums=('76fd9fbde97601227419d5a3b678ea20866e114bfb96e56e142a49670e8fac7b')

package() {
    cd $srcdir/Breeze_Blue
    install -d $pkgdir/usr/share/icons/Breeze_Blue
    cp -rf *   $pkgdir/usr/share/icons/Breeze_Blue
    chmod -R 644 $pkgdir/usr/share/icons/Breeze_Blue/*
    chmod 755 $pkgdir/usr/share/icons/Breeze_Blue
    chmod 755 $pkgdir/usr/share/icons/Breeze_Blue/cursors
}
