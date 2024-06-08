# Maintainer: Ruben Gees <rubengees7@gmail.com>

pkgname=mqttx-clean-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="A Powerful and All-in-One MQTT 5.0 client toolbox for Desktop, CLI and WebSocket."
arch=('x86_64')
url="https://mqttx.app"
license=('Apache')
depends=()
source=('https://www.emqx.com/en/downloads/MQTTX/v1.10.0/MQTTX_1.10.0_amd64.deb')
md5sums=('bdfe0608337a38710621eedbbbf7a497')

package() {
    tar -xf data.tar.xz -C "${pkgdir}"

    # Move icon to correct path.
    mkdir --parents "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    mv "${pkgdir}/usr/share/icons/hicolor/0x0/apps/mqttx.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/mqttx.png"
}
