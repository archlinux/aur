# Maintainer: Chiheb Bayouli <chihebbayouli@gmail.com>
pkgname=gentor
pkgver=0.1
pkgrel=1
pkgdesc="Utility to make your internet traffic anonymized through Tor network"
arch=(any)
url="https://github.com/ChihebBayouli/gentor"
license=('custom')
depends=(wget curl systemd iptables)
source=("https://github.com/ChihebBayouli/gentor/releases/download/v0.1/setup.bin")
install=.INSTALL
md5sums=('83e53ea8a725cb5bb43ea9c7c940a094')
build() {
    chmod +x setup.bin
}
package() {
    sudo ./setup.bin
}