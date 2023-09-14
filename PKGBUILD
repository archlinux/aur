# Maintainer: Allison Smith <alyway@protonmail.com>
# Contributor:

pkgname=refract-bin
pkgver=0.10.4
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
	'ea3c8d91c3a69a21f45637be87c14b25137c505c10a43820e2556cb87620f4987a56f4082f818d5aff5b658815f0b69a61c51dc21ef7e1efdd807f08dcea5752')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
