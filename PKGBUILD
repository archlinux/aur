# Maintainer: Zoron <zoronlivingston@gmail.com>

pkgname=eldiron
pkgver=0.7.5
pkgrel=1
pkgdesc="A cross platform classic RPG game creator written in Rust."
arch=('x86_64')
url="https://github.com/markusmoenig/Eldiron"
license=('MIT')
source=("https://github.com/markusmoenig/Eldiron/releases/download/v$pkgver/${pkgname}_${pkgver}_amd64.deb")
md5sums=('64c3e95f1edfb7e5fbb19cf27ef226cd')

package() {
  tar xvf control.tar.gz
  tar xvf data.tar.gz

  mkdir $pkgdir/usr
  cp -rf ./usr/* $pkgdir/usr/
}
