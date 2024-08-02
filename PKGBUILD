# Maintainer: Zoron <zoronlivingston at gmail>

pkgname=eldiron-bin
pkgver=0.8.11
pkgrel=1
pkgdesc="A cross platform classic RPG game creator written in Rust."
arch=('x86_64')
url="https://github.com/markusmoenig/Eldiron"
license=('MIT')
source=("Eldiron-v$pkgver.deb::https://github.com/markusmoenig/Eldiron/releases/download/v$pkgver/Eldiron.deb")
md5sums=('1e3a52c3311d67f6e194a9cc28cece04')

package() {
  tar xvf control.tar.gz
  tar xvf data.tar.gz

  mkdir $pkgdir/usr
  cp -rf ./usr/* $pkgdir/usr/
}
