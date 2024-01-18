# Maintainer: George McCarthy <mccarthee@outlook.com>
pkgname=breeze-snow-cursor
pkgver=5.27.10
pkgrel=1
pkgdesc="KDE Plasma's 'Breeze Snow' cursor theme."
arch=('any')
license=('GPL')
source=("https://download.kde.org/stable/plasma/$pkgver/breeze-$pkgver.tar.xz")
conflicts=('breeze-snow-cursor-theme')
sha256sums=("bebc960752da9d53a9895ffc05d824cba702735428aa61347b703fea074700a2")

package() {
  cd $srcdir/breeze-$pkgver/cursors/Breeze_Snow/Breeze_Snow
  install -d $pkgdir/usr/share/icons/Breeze_Snow
  cp -rf * $pkgdir/usr/share/icons/Breeze_Snow
  chmod -R 644 $pkgdir/usr/share/icons/Breeze_Snow/*
  chmod 755 $pkgdir/usr/share/icons/Breeze_Snow
  chmod 755 $pkgdir/usr/share/icons/Breeze_Snow/cursors
}
