# Maintainer: George McCarthy <mccarthee@outlook.com>

pkgname=breeze-cursor-theme
url="https://kde.org"
pkgver=6.0.3
pkgrel=1
pkgdesc="Breeze cursor theme (released with KDE Plasma 6.0)"
arch=("any")
license=("GPL")
source=("https://download.kde.org/stable/plasma/$pkgver/breeze-$pkgver.tar.xz")
sha256sums=("597c46097040ae79a4b47086c5cca121bf2b4479bcd0993026e9ccd260b4b1f9")
conflicts=('breeze>=6.0.0')

package() {
    cd $srcdir/breeze-$pkgver/cursors/Breeze/Breeze
    install -d $pkgdir/usr/share/icons/Breeze
    cp -rf * $pkgdir/usr/share/icons/Breeze
    chmod -R 644 $pkgdir/usr/share/icons/Breeze/*
    chmod 755 $pkgdir/usr/share/icons/Breeze
    chmod 755 $pkgdir/usr/share/icons/Breeze/cursors
}