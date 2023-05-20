# Maintainer: Allison Smith <alyway@protonmail.com>
# Contributor:

pkgname=refract-bin
pkgver=0.9.5
pkgrel=1
pkgdesc="Guided AVIF/JPEG XL/WebP conversion for JPEG and PNG sources."
arch=('x86_64')
url="https://github.com/Blobfolio/refract"
license=('WTFPL')
depends=('gtk3')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=(
	"https://github.com/Blobfolio/refract/releases/download/v0.9.5/refract_0.9.5-1_amd64.deb")
sha512sums=(
	'3a820b07cb5b2283f0a71c5c8fbfab0a98ea3dd1e450e92b4285a8220b120fa6a72ebf31261dbee3972c0471836446556df7ea00782b5e6fa5362049e298b168')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
