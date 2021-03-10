# Maintainer: Anthony W <trasformerfan |at| gmail |dot| com>
pkgname=minecraft-server-manager
pkgver=1.3.1
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
sha256sums=('f9e22e58610a5f051ae4f5707f9600be901d26806661dd29aa9d295b172ff8cf')

function package {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=$pkgdir install
}
