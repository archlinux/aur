pkgname=hammer-pdf
pkgver=1.0.1
pkgrel=1
pkgdesc="Hammer PDF - Smart Scientific Reader"
arch=("x86_64")
url="https://github.com/HammerPDF/Smart-Scientific-Reader"
depends=()
license=('custom')
provides=('HammerPDF')
source=("https://github.com/HammerPDF/Smart-Scientific-Reader/releases/download/v${pkgver}/Hammer.PDF-linux-${pkgver}.deb")

sha256sums=('95d0d374a5575a787dca4a52a8ef30d7a3412bd56ade4c9c0286f7fd9851907d')

package() {
	tar -xf data.tar.xz -C "${pkgdir}"
}