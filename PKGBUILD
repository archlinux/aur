# Maintainer: Jeremy Pope <jpope at jpope dot org> PGP-Key: E00B4261
pkgname=breeze-contrast-cursor-theme
pkgver=1.0
pkgrel=2
pkgdesc="Breeze Contrast cursor theme."
arch=('any')
url="https://kver.wordpress.com/2015/01/09/curses-i-mean-cursors/"
license=('GPL')
source=("https://share.kde.org/public.php?service=files&t=3e86f7cd39dd9db909da9c7ba5b3de5d&download")
makedepends=('unzip')

sha256sums=('055356ae4fe6050fe403b82a16abb909ef7e459cc3f64be77ca660bb951dcb61')

package() {
    cd $srcdir/Breeze_Contrast
    install -d $pkgdir/usr/share/icons/Breeze_Contrast
    cp -rf *   $pkgdir/usr/share/icons/Breeze_Contrast
    chmod -R 644 $pkgdir/usr/share/icons/Breeze_Contrast/*
    chmod 755 $pkgdir/usr/share/icons/Breeze_Contrast
    chmod 755 $pkgdir/usr/share/icons/Breeze_Contrast/cursors
}
