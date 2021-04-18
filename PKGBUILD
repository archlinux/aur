# Maintainer: Chiheb Bayouli <chihebbayouli@gmail.com>
pkgname=gentor
pkgver=0.2
pkgrel=1
pkgdesc="Utility to make your internet traffic anonymized through Tor network"
arch=(any)
url="https://github.com/ChihebBayouli/gentor"
license=('custom')
depends=(wget curl systemd iptables)
source=("https://github.com/ChihebBayouli/gentor/releases/download/v0.2/setup.tar.gz")
install=.INSTALL
md5sums=('2b84765ab2a628babf04e5ab75e5bcaa')
build() {
	tar -xzvf setup.tar.gz
    cd $srcdir
	cd setup
    chmod +x setup
}
package() {
	mv $srcdir/setup $pkgdir/
	cd $pkgdir/gentor/
    sudo ./setup
}
