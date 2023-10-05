# Maintainer: Allison Smith <alyway@protonmail.com>
# Contributor:

pkgname=refract-bin
pkgver=0.11.0
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
	'8ed234877377e22e416e6de13d3867de23912beefb14036b69d9095a35c4a3dc36fd9b0aabadbea890e52d3ec9ee494d35791a77ebd6b29528d9783223b66820')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
