# Maintainer: liberodark

pkgname=strawberry-bin
pkgver=0.2.1
pkgrel=41
pkgdesc="Strawberry Music Player"
arch=('x86_64')
url="http://www.strawbs.org/"
license=('GPL')
depends=(chromaprint protobuf gst-plugins-base-libs boost-libs qt5-base qt5-x11extras
         sqlite3 udisks2 pulseaudio dbus alsa-lib
         libcdio taglib)
optdepends=(gst-plugins-good
            gst-plugins-bad
            gst-plugins-ugly)
source_x86_64=("https://github.com/liberodark/Strawberry-Bin/releases/download/0.2.1-41/strawberry_0.2.1-41-g41b0b1e_amd64.deb")
sha512sums_x86_64=('f99b9cb70d49d555e517a2a4d68acc33493647f9763dfda4b73e1310b00f1ed811d497b6c58f8b2167ea412359804702e3db8fdbe01f2f834aed73a783df4bef')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
}

