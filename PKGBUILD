# Maintainer: Jeremy Pope <jpope at jpope dot org> PGP-Key: E00B4261
# Maintainer: George McCarthy <mccarthee@outlook.com>
pkgname=breeze-snow-cursor-theme
url="https://kde.org"
pkgver=5.27.11
pkgrel=1
pkgdesc="Breeze Snow cursor theme (the light cursor theme shipped with KDE Plasma 5.27.11 and older)"
arch=('any')
license=('GPL')
source=("https://download.kde.org/stable/plasma/$pkgver/breeze-$pkgver.tar.xz")
sha256sums=('14756a2fe5bc3db11ca954ff0df9b98e8d78ada4b231111780c42ee627dd4cab')
conflicts=('breeze<=5.27.11')

package() {
    cd $srcdir/breeze-$pkgver/cursors/Breeze_Snow/Breeze_Snow
    install -d $pkgdir/usr/share/icons/Breeze_Snow
    cp -rf * $pkgdir/usr/share/icons/Breeze_Snow
    chmod -R 644 $pkgdir/usr/share/icons/Breeze_Snow/*
    chmod 755 $pkgdir/usr/share/icons/Breeze_Snow
    chmod 755 $pkgdir/usr/share/icons/Breeze_Snow/cursors
}
