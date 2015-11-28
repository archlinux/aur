# Maintainer: FireZ <firez199984@gmail.com>
# !!IMPORTANT!! ONLY FOR RASPBERRY PI

pkgname=waveshare35a
pkgver=151020
pkgrel=2
pkgdesc="Overlay for waveshare 3.5inch RPi LCD (A)"
url="http://www.waveshare.net"
arch=('armv6h' 'armv7h')
source=("http://www.waveshare.net/w/upload/9/9d/LCD-show-${pkgver}.tar.gz")
md5sums=("833ac8e8c5a8a1fd4ee9139d66557994")
install="waveshare35a.install"

package() {
  cd "${srcdir}/LCD-show"
  install -Dm644 waveshare35a-overlay.dtb "${pkgdir}/boot/overlays/waveshare35a-overlay.dtb"
}
