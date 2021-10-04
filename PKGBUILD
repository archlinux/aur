# Maintainer: Anthony W <trasformerfan |at| gmail |dot| com>
pkgname=minecraft-server-manager
pkgver=1.5.2
pkgrel=1
pkgdesc="Manager for multiple Minecraft servers using unit files and a control script"
arch=('any')
url="https://github.com/HoodedDeath/$pkgname"
license=('MIT')
depends=('docker' 'bash' 'coreutils' 'mcrcon')
conflicts=('minecraft-server')
backup=('etc/minecraft')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/HoodedDeath/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('d4f44edecf7d7dbee98717d082c0ebd83fda594b2d326156c834dee313083e9b')

function package {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=$pkgdir install
}
