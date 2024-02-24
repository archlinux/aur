# Maintainer: Allison Smith <a1yk@tilde.gree>
# Contributor:

pkgname=refract-bin
pkgver=0.11.3
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
	'68c7b9df5d8584f6d7516b6f3d96f77073b9b4a534ba06568639f24248f8d44bf2b3625b8b063db163a833661299e78cc207a4a6f5047598c5bfe5eb54b63fad')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
