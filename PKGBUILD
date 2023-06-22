# Maintainer: Zoron <zoronlivingston at gmail>

pkgname=eldiron-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="A cross platform classic RPG game creator written in Rust."
arch=('x86_64')
url="https://github.com/markusmoenig/Eldiron"
license=('MIT')
source=("https://github.com/markusmoenig/Eldiron/releases/download/v$pkgver/Eldiron.deb")
md5sums=('bc21b204e50b48700cc394c4c07dbe24')

package() {
  tar xvf control.tar.gz
  tar xvf data.tar.gz

  mkdir $pkgdir/usr
  cp -rf ./usr/* $pkgdir/usr/
}
