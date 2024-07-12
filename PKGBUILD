# Maintainer: Zoron <zoronlivingston at gmail>

pkgname=eldiron-bin
pkgver=0.8.10
pkgrel=1
pkgdesc="A cross platform classic RPG game creator written in Rust."
arch=('x86_64')
url="https://github.com/markusmoenig/Eldiron"
license=('MIT')
source=("https://github.com/markusmoenig/Eldiron/releases/download/v$pkgver/Eldiron.deb")
md5sums=('1ae5db6ae0116443bb2ebc4c5c28c080')

package() {
  tar xvf control.tar.gz
  tar xvf data.tar.gz

  mkdir $pkgdir/usr
  cp -rf ./usr/* $pkgdir/usr/
}
