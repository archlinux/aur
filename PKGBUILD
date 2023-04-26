# Maintainer: Allison Smith <alyway@protonmail.com>
# Contributor:

pkgname=refract-bin
pkgver=0.9.4
pkgrel=1
pkgdesc="Guided AVIF/JPEG XL/WebP conversion for JPEG and PNG sources."
arch=('x86_64')
url="https://github.com/Blobfolio/refract"
license=('WTFPL')
depends=('gtk3')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=(
	"https://github.com/Blobfolio/refract/releases/download/v0.9.4/refract_0.9.4-1_amd64.deb")
sha512sums=(
	'd0d71589ec3061a98871557cf0e0560534ea75c58178344d74220d737832722ed098b726e250094cf69fb06d6336f1647ffe937530927d5db838714ac5f02394')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
