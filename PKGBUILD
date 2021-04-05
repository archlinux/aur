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
md5sums=('d106e09f82affd51f7f9c4c3bdebd04e')
build() {
    cd "$srcdir/$pkgname"
    sudo python install.py build
}
package() {
    cd "$srcdir/$pkgname"
    sudo python install.py install
}