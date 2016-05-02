# Maintainer: Jeremy Pope <jpope at jpope dot org> PGP-Key: E00B4261
pkgname=breeze-hacked-cursor-theme
pkgver=1.0
pkgrel=3
pkgdesc="Breeze Hacked cursor theme."
arch=('any')
url="https://kver.wordpress.com/2015/01/09/curses-i-mean-cursors/"
license=('GPL')
source=("https://code.jpope.org/jpope/breeze_cursor_sources/raw/master/breeze-hacked-cursor-theme.zip")
makedepends=('unzip')

sha256sums=('675b9d1f8e0718505da82abcf0e3377e1e509bd0be71e3c0998136c3895a6b15')

package() {
    cd $srcdir/Breeze_Hacked
    install -d $pkgdir/usr/share/icons/Breeze_Hacked
    cp -rf *   $pkgdir/usr/share/icons/Breeze_Hacked
    chmod -R 644 $pkgdir/usr/share/icons/Breeze_Hacked/*
    chmod 755 $pkgdir/usr/share/icons/Breeze_Hacked
    chmod 755 $pkgdir/usr/share/icons/Breeze_Hacked/cursors
}
