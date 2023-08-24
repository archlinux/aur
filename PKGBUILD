# Maintainer: Allison Smith <alyway@protonmail.com>
# Contributor:

pkgname=refract-bin
pkgver=0.10.3
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
	'1f0470125aa6e89ea3be5a52cc91cd8711b25d5a53834110a509d92fb1f27d825d30a95e9bdc8810d5f38cf7561d7d9818df79fc7e156afdd7aae30f63c9aa99')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
