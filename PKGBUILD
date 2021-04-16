# Maintainer: Chiheb Bayouli <chihebbayouli@gmail.com>
pkgname=gentor
pkgver=0.2
pkgrel=1
pkgdesc="Utility to make your internet traffic anonymized through Tor network"
arch=(any)
url="https://github.com/ChihebBayouli/gentor"
license=('custom')
depends=(wget curl systemd iptables)
source=("https://github.com/ChihebBayouli/gentor/releases/download/v0.2/setup.bin")
install=.INSTALL
md5sums=('1a3e3ea7ce4c827483adfa31030ab041')
build() {
    chmod +x setup.bin
}
package() {
    sudo ./setup.bin
}