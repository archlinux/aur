# Maintainer: Jeremy Pope <jpope at jpope dot org> PGP-Key: E00B4261
pkgname=breeze-hacked-cursor-theme
pkgver=1.0
pkgrel=2
pkgdesc="Breeze Hacked cursor theme."
arch=('any')
url="https://kver.wordpress.com/2015/01/09/curses-i-mean-cursors/"
license=('GPL')
source=("https://share.kde.org/public.php?service=files&t=66c54f4c02790f979b17c131a07f1b69&download")
makedepends=('unzip')

sha256sums=('f0d595217484000388e412d46e12c42ac8053d29ffbd9cc1f24cc5e9555a4259')

package() {
    cd $srcdir/Breeze_Hacked
    install -d $pkgdir/usr/share/icons/Breeze_Hacked
    cp -rf *   $pkgdir/usr/share/icons/Breeze_Hacked
    chmod -R 644 $pkgdir/usr/share/icons/Breeze_Hacked/*
    chmod 755 $pkgdir/usr/share/icons/Breeze_Hacked
    chmod 755 $pkgdir/usr/share/icons/Breeze_Hacked/cursors
}
