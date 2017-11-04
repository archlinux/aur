# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=tshock-worldedit
pkgver=1.4.9
pkgrel=1
pkgdesc="Adds mass tile editing commands for TShock."
url="https://tshock.co/xf/index.php?resources/worldedit.${pkgver//./}/"
arch=('x86_64' 'i686')
license=('unknown')
depends=('tshock=4.3.19')

source=("https://github.com/NyxStudios/WorldEdit/releases/download/v${pkgver}/WorldEdit.dll")
sha512sums=('313794fc12c45ae0fea7882e1589a4f594d7910bd91627b3c4d7a042a2482622ef57f5144448accab47fd882bc6d10b67e740347e06053dbb4d5595c5e62aca8')

package() {
	install -Dm644 "${srcdir}/WorldEdit.dll" "${pkgdir}/srv/tshock/ServerPlugins/WorldEdit.dll"
}
