# Maintainer: George McCarthy <mccarthee@outlook.com>
pkgname=breeze-light-cursor-theme
pkgver=6.0.0
pkgrel=2
pkgdesc="Breeze Light cursor theme (released with KDE Plasma 6.0)"
arch=('any')
license=('GPL')
source=("https://download.kde.org/stable/plasma/$pkgver/breeze-$pkgver.tar.xz")
conflicts=('breeze-snow-cursor-theme')
sha256sums=("bc72a16b116b7beabf1b4e9a451019f9048e7be6b05ac73a4627f25b2c2059ea")

package() {
    cd $srcdir/breeze-$pkgver/cursors/Breeze_Light/Breeze_Light
    install -d $pkgdir/usr/share/icons/Breeze_Light
    cp -rf * $pkgdir/usr/share/icons/Breeze_Light
    chmod -R 644 $pkgdir/usr/share/icons/Breeze_Light/*
    chmod 755 $pkgdir/usr/share/icons/Breeze_Light
    chmod 755 $pkgdir/usr/share/icons/Breeze_Light/cursors
}
