# Maintainer: Allison Smith <alyway@protonmail.com>
# Contributor:

pkgname=refract-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="Guided AVIF/JPEG XL/WebP conversion for JPEG and PNG sources."
arch=('x86_64')
url="https://github.com/Blobfolio/refract"
license=('WTFPL')
depends=('gtk3')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=(
	"https://github.com/Blobfolio/refract/releases/download/v0.9.2/refract_0.9.2-1_amd64.deb")
sha512sums=(
	'ef1a9bbfd0036dfc0708c5af639ebf1747ec43f5c92a6f0058d43771f2b5808afdc7efc17714065114c44d881f9b3c738be7a069695221aad302bc0d3ac50533')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
