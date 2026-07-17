# Maintainer: Zoron <zoronlivingston at gmail>

pkgname=eldiron-bin
pkgver=0.92.0
pkgrel=1
pkgdesc="A cross platform classic RPG game creator written in Rust."
arch=('x86_64')
url="https://github.com/markusmoenig/Eldiron"
license=('MIT')
source=("Eldiron-v$pkgver.deb::https://github.com/markusmoenig/Eldiron/releases/download/v$pkgver/Eldiron-Creator.deb")
md5sums=('a511d2ebf3250574a252c510da670692')

package() {
  tar xvf data.tar.gz

  mkdir $pkgdir/usr
  cp -rf ./usr/* $pkgdir/usr/
}
