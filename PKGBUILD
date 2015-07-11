# Maintainer: Jeremy Pope <jpope at jpope dot org> PGP-Key: E00B4261
pkgname=breeze-snow-cursor-theme
pkgver=1.0
pkgrel=2
pkgdesc="Breeze Snow cursor theme."
arch=('any')
url="https://kver.wordpress.com/2015/01/09/curses-i-mean-cursors/"
license=('GPL')
source=("https://share.kde.org/public.php?service=files&t=0961e0d81ccf38e12950e1fc435450a4&download")
makedepends=('unzip')

sha256sums=('9fbc4110202627cd664be26a2e01f50ec9198dff6a81f2cb98b75d70359d6483')

package() {
    cd $srcdir/Breeze_Snow
    install -d $pkgdir/usr/share/icons/Breeze_Snow
    cp -rf *   $pkgdir/usr/share/icons/Breeze_Snow
    chmod -R 644 $pkgdir/usr/share/icons/Breeze_Snow/*
    chmod 755 $pkgdir/usr/share/icons/Breeze_Snow
    chmod 755 $pkgdir/usr/share/icons/Breeze_Snow/cursors
}
