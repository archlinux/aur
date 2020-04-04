#Maintainer: NiNjA <heinep at gmail dot com>

_firmware=dvb-demod-si2168-b40-01.fw
pkgname=hauppauge-wintv-quadhd-firmware
pkgver=1.0
pkgrel=1
pkgdesc="Hauppauge WinTV-quadHD DVB firmware"
arch=('any')
url="https://www.linuxtv.org/wiki/index.php/Hauppauge_WinTV-quadHD_(DVB-T/T2/C)"
license=('custom')
source=("http://www.hauppauge.com/linux/$_firmware")
sha256sums=('8507536630d75a316d0719d6b95c04b90c36baa5b457ad457c9bacadafcef134')

package() {
    install -Dm755 "$srcdir/$_firmware" "$pkgdir/usr/lib/firmware/$_firmware"
}
