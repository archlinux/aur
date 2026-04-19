# Maintainer: Zoron <zoronlivingston at gmail>

pkgname=eldiron-bin
pkgver=0.9.4
pkgrel=1
pkgdesc="A cross platform classic RPG game creator written in Rust."
arch=('x86_64')
url="https://github.com/markusmoenig/Eldiron"
license=('MIT')
source=("Eldiron-v$pkgver.deb::https://github.com/markusmoenig/Eldiron/releases/download/v$pkgver/Eldiron-Creator.deb")
md5sums=('68d0bb15a7f125be67bba69743d870b4')

package() {
  tar xvf data.tar.gz

  mkdir $pkgdir/usr
  cp -rf ./usr/* $pkgdir/usr/
}
