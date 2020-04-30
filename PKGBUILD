# Maintainer: Shayne Hartford<shayneehartford@gmail.com>

pkgname=nbteditor-bin
_pkgname=nbteditor
pkgver=1.3
pkgrel=1
pkgdesc="Editor for Minecraft NBT and schematic files"
url="https://github.com/Howaner/NBTEditor"
arch=('x86_64')
license=('BSD')
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('e78ccaa367aad3060c73e43ab29768e83845f1d90468903c53000f4b711a6c04')

package() {
	cd "${srcdir}"

	tar -xJf data.tar.xz -C "${pkgdir}"
}
