# Maintainer: Zoron <zoronlivingston at gmail>

pkgname=eldiron-bin
pkgver=0.91.0
pkgrel=1
pkgdesc="A cross platform classic RPG game creator written in Rust."
arch=('x86_64')
url="https://github.com/markusmoenig/Eldiron"
license=('MIT')
source=("Eldiron-v$pkgver.deb::https://github.com/markusmoenig/Eldiron/releases/download/v$pkgver/Eldiron-Creator.deb")
md5sums=('9e34fc5490ed5c072ca85c792de2135d')

package() {
  tar xvf data.tar.gz

  mkdir $pkgdir/usr
  cp -rf ./usr/* $pkgdir/usr/
}
