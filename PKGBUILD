# Maintainer: puleiya <ninettristan@gmail.com>
pkgname=zedfree
pkgver=2020.4
pkgrel=1
pkgdesc="Zed! Encrypted containers manager"
arch=("i686" "x86_64")
url="http://www.primx.eu"
license=("GPL")
depends=("libxslt" "qt5-base" "hicolor-icon-theme")
options=("!strip" "!emptydirs")
install=${pkgname}.install
source_i686=("https://www.zedencrypt.com/file/get/-/item_key/13802-21-0a970608")
source_x86_64=("https://www.zedencrypt.com/file/get/-/item_key/13802-22-1d9a6a64")
sha512sums_i686=("d01c969c9bb0d5b0a5c667b1bfbb0aead1cb5687af0b508ac0e69fa69165497e39ec3b96885bda766862ee9a06a30191ed7efe2758e95b077a4ee03a2a75073b")
sha512sums_x86_64=("f5d39435b86181cbfa6e56b6716de2e3cd1072d270eb01f5eb59c2090e75193030f6d01c4cfa8472800a9cc28576e2f04ea1994f12fd721ebb4785cf6997e066")

package(){

	# Extract package data
	tar --extract --file data.tar.xz -C "${pkgdir}"

    find "${pkgdir}" -type d -print0 | xargs -0 chmod 755

}
