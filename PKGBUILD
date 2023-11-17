# Maintainer: Allison Smith <alyway@protonmail.com>
# Contributor:

pkgname=refract-bin
pkgver=0.11.1
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
	'617b627bc1119d7b21c52b45a9f493c91e4993f5abf376e0086a81fb233ec1280746e28d2fcd326d2e948e615172223ecbed330e98e86c84d9a32a803a8015db')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
