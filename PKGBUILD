# Maintainer: Allison Smith <alyway@protonmail.com>
# Contributor:

pkgname=refract-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="Guided AVIF/JPEG XL/WebP conversion for JPEG and PNG sources."
arch=('x86_64')
url="https://github.com/Blobfolio/refract"
license=('WTFPL')
depends=('gtk3')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=(
	"https://github.com/Blobfolio/refract/releases/download/v${pkgver}/refract_${pkgver}-1_amd64.deb")
sha512sums=(
	'acfc83abe938faa71ff42597bc5da08f4094b6851cb977a38196197ebc77740ccd8dd5c3c62067121f69f954147a65b10a93953a7df4fc4b0ef46dd6e7816ea3')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
