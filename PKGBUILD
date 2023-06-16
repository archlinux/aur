# Maintainer: Allison Smith <alyway@protonmail.com>
# Contributor:

pkgname=refract-bin
pkgver=0.10.1
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
	'b1f584bd7e805e0d4464f598c6a96f9f4939f928ae75290dc57ce4b55f1388afbb7658be5f93b63c44972f6bcd4d44ad20e8e687e033746f5821229f14614220')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
