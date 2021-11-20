pkgname=hammer-pdf
pkgver=1.1.0
pkgrel=1
pkgdesc="Hammer PDF - Smart Scientific Reader"
arch=("x86_64")
url="https://github.com/HammerPDF/Smart-Scientific-Reader"
depends=()
license=('custom')
provides=('HammerPDF')
source=("https://github.com/HammerPDF/Smart-Scientific-Reader/releases/download/v${pkgver}/Hammer.PDF-linux-${pkgver}.deb")

sha256sums=('30c3dbb190de1de6eb728539556d3ec3da685de371bc87dbc1658f9973dfcfab')

package() {
	tar -xf data.tar.xz -C "${pkgdir}"
}