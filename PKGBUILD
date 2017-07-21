# Maintainer: fila pruda com

pkgname=xc3028-fw
pkgver=27
pkgrel=1
pkgdesc="Firmware for Xceive XC3028 tuners"
arch=('any')
url="https://linuxtv.org/wiki/index.php/Xceive_XC3028/XC2028"
license=('GPL')
source=("https://github.com/OpenELEC/dvb-firmware/raw/master/firmware/xc3028-v${pkgver}.fw")
sha256sums=('0d4cfd7974a19a94f4d42eb2d160d5a3e71cca1cfa61bd2cc063cf3f36ffd32e')

package() {
    install -D -m 0644 "${srcdir}/xc3028-v${pkgver}.fw" \
        "${pkgdir}/usr/lib/firmware/xc3028-v${pkgver}.fw"
}

