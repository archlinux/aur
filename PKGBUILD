# Maintainer: Anthony W <trasformerfan |at| gmail |dot| com>
pkgname=minecraft-server-manager
pkgver=1.5
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
sha256sums=('8f232c4091258138ca16c9f88df85b166867d773f1094ab4a992941b702f64ea')

function package {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=$pkgdir install
}
