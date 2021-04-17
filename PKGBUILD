# Maintainer: Chiheb Bayouli <chihebbayouli@gmail.com>
pkgname=gentor
pkgver=0.2
pkgrel=1
pkgdesc="Utility to make your internet traffic anonymized through Tor network"
arch=(any)
url="https://github.com/ChihebBayouli/gentor"
license=('custom')
depends=(wget curl systemd iptables)
source=("https://github.com/ChihebBayouli/gentor/releases/download/v0.2/setup")
install=.INSTALL
md5sums=('60189d1d1f03718790946759755adad0')
build() {
    cd "$srcdir"
    chmod +x setup
}
package() {
    sudo ./setup
}
