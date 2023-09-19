# Maintainer: Allison Smith <alyway@protonmail.com>
# Contributor:

pkgname=refract-bin
pkgver=0.10.5
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
	'a3bc5ebf2c0f266b3845e6fdf2d3515620efb60fae07c27458a45bf145bfaa39139a5ebacb2faead39205e689a240d5dc34fffbc34eb8d10ed4c47c3f28ee0fe')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
