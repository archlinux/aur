# Maintainer: Allison Smith <a1yk@tilde.gree>
# Contributor: jstoik1 <joshstoik@gmail.com>

pkgname=refract-bin
pkgver=1.0.1
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
	'1ed000a41346dbe12885197dc86e0684c2a9bd7c04cb32ed321a4ae281669a222c5b7799a69409d4c8d49d304e82d4bda06dd7a04012ac8a997a9fe7fd9d033a')

package(){

	# Extract package data
	tar -x --zstd -f data.tar.zst -C "${pkgdir}"

}
