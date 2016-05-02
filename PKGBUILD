# Maintainer: Jeremy Pope <jpope at jpope dot org> PGP-Key: E00B4261
pkgname=breeze-snow-cursor-theme
pkgver=1.0
pkgrel=3
pkgdesc="Breeze Snow cursor theme."
arch=('any')
url="https://kver.wordpress.com/2015/01/09/curses-i-mean-cursors/"
license=('GPL')
source=("https://code.jpope.org/jpope/breeze_cursor_sources/raw/master/breeze-snow-cursor-theme.zip")
makedepends=('unzip')

sha256sums=('1390272e693f258dc55f86fbd5c99f0f36cfb4e71f22e9062b8d6ff14483562e')

package() {
    cd $srcdir/Breeze_Snow
    install -d $pkgdir/usr/share/icons/Breeze_Snow
    cp -rf *   $pkgdir/usr/share/icons/Breeze_Snow
    chmod -R 644 $pkgdir/usr/share/icons/Breeze_Snow/*
    chmod 755 $pkgdir/usr/share/icons/Breeze_Snow
    chmod 755 $pkgdir/usr/share/icons/Breeze_Snow/cursors
}
