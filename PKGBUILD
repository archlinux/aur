# Maintainer: f4iey <jules@f4iey.fr>
pkgname=wfview-bin
pkgver=2.03
pkgrel=2
pkgdesc="Interface for Icom Transceivers - binary version"
arch=('x86_64')
url="https://wfview.org"
license=('GPL3')
depends=(hidapi opus portaudio qcustomplot qt5-base qt5-gamepad qt5-multimedia qt5-serialport) 
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=('http://ftp.debian.org/debian/pool/main/w/${pkgname%-bin}/${pkgname%-bin}_$pkgver-$pkgrel_amd64.deb')
md5sums=(4b086ac303401cc2a645d9936ac96e80)

package() {
  cd $srcdir
  tar -C $pkgdir/ -xvf data.tar.xz
  cd $pkgdir  
  chmod 755 usr/ usr/share/ usr/bin/ usr/share/doc/
  chmod 755 usr/share/applications/ usr/share/pixmaps/
}
