# Maintainer: ticnoo <ticnoomail@gmail.com>
pkgname=vpnz-waybar-bin
pkgver=0.1
pkgrel=1
pkgdesc="A Waybar custom module to monitor and toggle VPN Apps"
arch=('x86_64')
url="https://github.com/ticnoo/vpnz-waybar"
license=('MIT')
provides=('vpnz-waybar')
conflicts=('vpnz-waybar')
source=("${pkgname}-${pkgver}::https://github.com/ticnoo/vpnz-waybar/releases/download/${pkgver}/vpnz-waybar")
sha256sums=('f6b85210c8fcc7305f2cdf6a5402076f1d4c6eda147b042040e28c54bfcf8158')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/vpnz-waybar"
}
