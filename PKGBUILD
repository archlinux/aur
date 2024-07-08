#Maintainer: Walter <preparationh67 at gmail dot com>
pkgname=linux-firmware-hauppauge
pkgver=0.2.2
pkgrel=1
pkgdesc="Additional Hauppauge Firmware"
arch=('any')
url="https://www.hauppauge.com/pages/support/support_linux.html"
license=('custom')
conflicts=('hauppauge-wintv-quadhd-firmware')
provides=('hauppauge-wintv-quadhd-firmware')
_source=linux-firmware-hauppauge_$pkgver+focal.tar.gz
_exsource=linux-firmware-hauppauge-$pkgver+focal
source=("http://ppa.launchpad.net/b-rad/kernel+mediatree+hauppauge/ubuntu/pool/main/l/linux-firmware-hauppauge/$_source")

package() {
    tar -xzf "$srcdir/$_source"
    install -d "$pkgdir/usr/lib/firmware"
    install -m644 "$srcdir/$_exsource/install/0/dvb-demod-m88ds3103b.fw" "$pkgdir/usr/lib/firmware/"
    install -m644 "$srcdir/$_exsource/install/0/dvb-demod-m88ds3103.fw" "$pkgdir/usr/lib/firmware/"
    install -m644 "$srcdir/$_exsource/install/0/dvb-demod-mxl692.fw" "$pkgdir/usr/lib/firmware/"
    install -m644 "$srcdir/$_exsource/install/0/dvb-demod-si2168-b40-01.fw" "$pkgdir/usr/lib/firmware/"
    install -m644 "$srcdir/$_exsource/install/0/dvb-demod-si2168-d60-01.fw" "$pkgdir/usr/lib/firmware/"
    install -m644 "$srcdir/$_exsource/install/0/dvb-tuner-si2157-a30-01.fw" "$pkgdir/usr/lib/firmware/"
    install -m644 "$srcdir/$_exsource/install/0/NXP7164-2010-03-10.1.fw" "$pkgdir/usr/lib/firmware/"
    install -m644 "$srcdir/$_exsource/install/0/NXP7164-2010-04-01.1.fw" "$pkgdir/usr/lib/firmware/"
    install -m644 "$srcdir/$_exsource/install/0/v4l-pvrusb2-73xxx-01.fw" "$pkgdir/usr/lib/firmware/"

}
sha256sums=('de3ce6ff1508617f4256e39ad79227b1707aa60536088e65d3441e4bd8a76c08')
