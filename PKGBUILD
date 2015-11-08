# Maintainer: Hal Martin <hal.martin@gmail.com>
pkgname=openpilot
pkgver=15.02.02
pkgrel=1
pkgdesc="Ground Control Station to configure CC3D, Revolution controllers"
arch=(x86_64)
url="https://github.com/openpilot/OpenPilot/releases/tag/RELEASE-15.02.02"
license=('GPLv3')
depends=('fontconfig>=2.9.0' 'freetype2>=2.3.5' 'glib2>=2.22.0' 'gst-plugins-base>=0.11.0' 'gstreamer>=0.11.0' 'libpulse>=5.0' 'sdl>=1.2.11' 'libusb>=1.0.9' 'libx11>=1.6' 'libxcb>=1.10' 'libxi>=1.3' 'libxrender>=0.9.9')
makedepends=(tar)
provides=()
install=
changelog=
source=(http://www.openpilot.org/wp-content/uploads/OP-Downloads/openpilot_15.02.02-1_amd64.deb)
noextract=()
md5sums=('a872004f71105f41c549d9c77b5faec5')

package() {
  tar -Jxf data.tar.xz

  cp -pR usr $pkgdir/
  cp -pR lib $pkgdir/usr/
}
