# Maintainer: Anthony W <trasformerfan |at| gmail |dot| com>
pkgname=minecraft-server-manager
pkgver=1.4
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
sha256sums=('da6495f6c4a8f673c130638c62c3ebd508f3ce7f7ea90c2a9e0aa10abbd4a9d4')

function package {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=$pkgdir install
}
