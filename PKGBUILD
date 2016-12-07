# Maintainer: FireZ <firez199984@gmail.com>
# !!IMPORTANT!! ONLY FOR RASPBERRY PI

pkgname=waveshare35a
pkgurl="4/4b"
pkgver=161112
pkgrel=1
pkgdesc="Overlay for waveshare 3.5inch RPi LCD (A)"
url="http://www.waveshare.net"
arch=('armv6h' 'armv7h')
source=("http://www.waveshare.net/w/upload/${pkgurl}/LCD-show-${pkgver}.tar.gz")
md5sums=("e91fbcfbd0fe19b1f8a9bda4a5005f82")
install="waveshare35a.install"

package() {
  cd "${srcdir}/LCD-show"
  install -Dm644 waveshare35a-overlay.dtb "${pkgdir}/boot/overlays/waveshare35a-overlay.dtb"
  install -Dm644 waveshare35a-overlay.dtb "${pkgdir}/boot/overlays/waveshare35a.dtbo"
}
