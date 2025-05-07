# Maintainer: Justin Schilleman <justin@schilleman.com>
# Upstream: Bitwig GmbH <support@bitwig.com>

pkgname='bitwig-control-panel'
pkgver='1.0'
pkgrel='1'
pkgdesc='Control Panel software for the Bitwig Connect audio interface'
arch=('x86_64')
url='https://www.bitwig.com/'
license=('custom')
depends=('alsa-lib' 'cairo' 'gdk-pixbuf2' 'gtk3' 'libbsd' 'libusb' 'libxi' 'xcb-util-wm' 'xcb-imdkit' 'xdg-utils')
source=("bitwig-connect-control-panel-${pkgver}.deb::https://www.bitwig.com/dl/?id=600&os=installer_linux")
sha256sums=('366da10032ceb6f976feb734bf6096c06661ee0f600d3249ac30b7803a606fac')
options=(!strip)

package() {
  bsdtar -xf ${srcdir}/data.tar.zst -C ${pkgdir}/
}
