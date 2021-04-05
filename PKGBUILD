# Maintainer: Chiheb Bayouli <chihebbayouli@gmail.com>
pkgname=gentor
pkgver=0.1
pkgrel=1
pkgdesc="Utility to make your internet traffic anonymized through Tor network"
arch=(any)
url="https://github.com/ChihebBayouli/gentor"
license=('custom')
depends=(wget curl systemd iptables)
source=("https://github.com/ChihebBayouli/gentor/releases/download/0.1/setup.bin")
install=.INSTALL
md5sums=('0b241856746e881cf8e0041b4de3a71a')
build() {
    chmod +x setup.bin
}
package() {
    sudo ./setup.bin
}