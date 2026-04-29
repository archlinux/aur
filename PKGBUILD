# Maintainer: Allison Smith <a1yk@tilde.gree>
# Contributor: jstoik1 <joshstoik@gmail.com>

pkgname=refract-bin
pkgver=1.4.3
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
	'f7f7dbb6b044950c66cd758c56faf8762448663129a93798357afd8e03d6bbdad4dbb2b427779c7675beb9f31e45c22255d192c576c29b341ef59b538eb5a9df')

package(){

	# Extract package data
	tar -x --zstd -f data.tar.zst -C "${pkgdir}"

}
