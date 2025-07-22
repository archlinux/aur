# Maintainer: Nguyen Ky nhktmdzhg at google mail dot com
pkgname=nmcurse-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="A terminal-based NetworkManager interface"
arch=('x86_64')
url="https://github.com/nhktmdzhg/nmcurse-rs"
license=('MIT')
depends=('networkmanager' 'ncurses')
provides=('nmcurse')
conflicts=('nmcurse')
source=("nmcurse-linux-amd64::https://github.com/nhktmdzhg/nmcurse-rs/releases/download/v${pkgver}/nmcurse-linux-amd64")
sha256sums=('6f3875d29795c4a80efd524e2b8914b739074c8d1412c1e30bca8b2ae68720d0')

package() {
    install -Dm755 "${srcdir}/nmcurse-linux-amd64" "${pkgdir}/usr/bin/nmcurse"
}
