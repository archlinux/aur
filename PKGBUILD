# Maintainer: Allison Smith <a1yk@tilde.gree>
# Contributor:

pkgname=refract-bin
pkgver=0.11.4
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
	'affc407ed8a85e108819c142da609a0236fc102d39645359f83ad8b4c5c2562874f7a224fd980d7b356664dbb3249835d178cbd211314575f84aa68c4bb1cc5e')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
