# Maintainer: liberodark

pkgname=joxi
pkgver=3.0.13
pkgrel=1
pkgdesc="Free tool for screen capture"
arch=('x86_64')
url="http://joxi.net"
license=('Custom')
depends=('qt5-declarative' 'qt5-x11extras' 'qt5-base' 'qt5-script' 'qt5-xmlpatterns' 'qt5-multimedia' 'qt5-quick1' 'libgl' 'libx11' 'libstdc++5' 'libxdamage' 'glib2' 'gtk2' 'libmcrypt' 'libcurl-compat' 'libappindicator-gtk2')
source_x86_64=("http://dl.joxi.ru/linux/joxi-amd64.deb")
sha512sums_x86_64=('05f54d2a544b30fdd887e8aa2689ffc2395d69b1649c9cf0d667beaaf13d39ade72d31d45103fe13a120d5da2e3144ce5c6e4db81688a20e253ef160b7ea4f4b')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r etc $pkgdir
  cp -r opt $pkgdir
  cp -r usr $pkgdir
}
