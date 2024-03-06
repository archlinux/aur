# Maintainer: George McCarthy <mccarthee@outlook.com>

pkgname=breeze-light-cursor-theme
pkgver=6.0.1
pkgrel=1
pkgdesc="Breeze Light cursor theme (released with KDE Plasma 6.0)"
arch=('any')
license=('GPL')
source=("https://download.kde.org/stable/plasma/$pkgver/breeze-$pkgver.tar.xz")
sha256sums=("200482cefd066e0d48e16aa7380a9cb00e634b2ba34834cdc7354f363b60544d")

package() {
    cd $srcdir/breeze-$pkgver/cursors/Breeze_Light/Breeze_Light
    install -d $pkgdir/usr/share/icons/Breeze_Light
    cp -rf * $pkgdir/usr/share/icons/Breeze_Light
    chmod -R 644 $pkgdir/usr/share/icons/Breeze_Light/*
    chmod 755 $pkgdir/usr/share/icons/Breeze_Light
    chmod 755 $pkgdir/usr/share/icons/Breeze_Light/cursors
}