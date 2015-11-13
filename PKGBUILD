# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=tshock-worldedit
pkgver=1.4.3
pkgrel=1
pkgdesc="Adds mass tile editing commands for TShock."
url="https://tshock.co/xf/index.php?resources/worldedit.${pkgver//./}/"
arch=('x86_64' 'i686')
license=('unknown')
depends=('tshock')

source=("https://raw.githubusercontent.com/NyxStudios/WorldEdit/master/WorldEdit/bin/WorldEdit.dll")
sha512sums=('29fd34b81077bf608b6ac55a7d661d422f910af384051c5f13ab13bb8ec50cdff676f10d8fa11e91581315b70715d2cd24832a3b5f9f2bda7957ad60895adb10')

package() {
	install -Dm644 "${srcdir}/WorldEdit.dll" "${pkgdir}/srv/tshock/ServerPlugins/WorldEdit.dll"
}
