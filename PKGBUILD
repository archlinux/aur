# Maintainer: Allison Smith <a1yk@tilde.gree>
# Contributor: jstoik1 <joshstoik@gmail.com>

pkgname=refract-bin
pkgver=0.11.9
pkgrel=1
pkgdesc="Guided AVIF/JPEG XL/WebP conversion for JPEG and PNG sources."
arch=('x86_64')
url="https://github.com/Blobfolio/refract"
license=('WTFPL')
depends=('gtk3')
makedepends=('zstd')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=(
	"https://github.com/Blobfolio/refract/releases/download/v${pkgver}/refract_${pkgver}-1_amd64.deb")
sha512sums=(
	'87dbfeb4f0de1bb28254478c9cec94dc81f1e3c0e2d7b3ca9706f8a9392fc3584daa8c283e4d8bf03bc9b7c12a7202817579f46787b87ebda167b9c495bdd754')

package(){

	# Extract package data
	tar -x --zstd -f data.tar.zst -C "${pkgdir}"

}
