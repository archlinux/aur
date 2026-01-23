# Maintainer: Allison Smith <a1yk@tilde.gree>
# Contributor: jstoik1 <joshstoik@gmail.com>

pkgname=refract-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Guided AVIF/JPEG XL/WebP conversion for JPEG and PNG sources."
arch=('x86_64')
url="https://github.com/Blobfolio/refract"
license=('WTFPL')
depends=('xdg-desktop-portal')
makedepends=('zstd')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=(
	"https://github.com/Blobfolio/refract/releases/download/v${pkgver}/refract_${pkgver}-1_amd64.deb")
sha512sums=(
	'1952ab18097729aaaed66c61327102014465ff71e212fafdff992dd273f9745f364a42bbd896fa1271713c78297665ac20649162741277d08b37a2907f9acd13')

package(){

	# Extract package data
	tar -x --zstd -f data.tar.zst -C "${pkgdir}"

}
