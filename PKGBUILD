# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps4000a
pkgver=1.4.0_2r11
pkgrel=1
pkgdesc="library for picotech oscilloscope 4000a series (4824)"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='9dff107a61f863183cae5ce86367e90d'
else
  _arch="amd64"
  _md5sum='2dacaddb249acdc8914260f4d5075738'
fi
url="http://www.picotech.com/linux.html"
license=('custom')
groups=()
depends=(libusb)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("http://labs.picotech.com/debian/pool/main/libp/libps4000a/${pkgname}_${pkgver//_/-}_${_arch}.deb")
md5sums=($_md5sum)

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
