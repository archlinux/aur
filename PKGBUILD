# Maintainer: Chiheb Bayouli <chihebbayouli@gmail.com>
pkgname=gentor
pkgver=0.2
pkgrel=1
pkgdesc="Utility to make your internet traffic anonymized through Tor network"
arch=(any)
url="https://github.com/ChihebBayouli/gentor"
license=('custom')
depends=(wget curl systemd iptables)
source=("https://github.com/ChihebBayouli/gentor/releases/download/v0.2/setup.sh")
install=.INSTALL
md5sums=('b0cb18aac523c689a12a223abf95be81')
build() {
    chmod +x setup.sh
}
package() {
    sudo ./setup.sh
}