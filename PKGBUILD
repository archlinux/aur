# Maintainer: Chiheb Bayouli <chihebbayouli@tuta.io>
pkgname=gentor
pkgver=0.3
pkgrel=1
pkgdesc="Utility to make your internet traffic anonymized through Tor network"
arch=(any)
url="https://github.com/ChihebBayouli/gentor"
license=('EULA')
depends=(wget curl systemd iptables)
source=("https://github.com/ChihebBayouli/gentor/releases/download/v0.2/setup")
install=.INSTALL
md5sums=('4209bd86db4196843282503355fdb9d7')
build() {
	chmod +x setup
}
package() {
	sudo ./setup
}
