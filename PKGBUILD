# Maintainer: Allison Smith <a1yk@tilde.gree>
# Contributor: jstoik1 <joshstoik@gmail.com>

pkgname=refract-bin
pkgver=1.0.0
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
	'4ef6f3249513d1e97952f33144568c0dd2769e37376312097ee44ace6abdf2daf4480e4e25ced9cad99eb676df2efedb14a5bd4aa9ad2cbd5f6901f9c07141b6')

package(){

	# Extract package data
	tar -x --zstd -f data.tar.zst -C "${pkgdir}"

}
