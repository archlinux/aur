# Maintainer: Allison Smith <alyway@protonmail.com>
# Contributor:

pkgname=refract-bin
pkgver=0.10.0
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
	'560be218a296b12ae82863bc64ad775b1133abc29e646b62335b34af07916836bd2c0d0f9dfcddab50732c68cd6b1c58f2ebbe4833821ae13184b0e29c93d4f0')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
