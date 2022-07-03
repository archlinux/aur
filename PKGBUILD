pkgname=hammer-pdf
pkgver=1.2.2
pkgrel=1
pkgdesc="Hammer PDF - Smart Scientific Reader"
arch=("x86_64")
url="https://github.com/HammerPDF/Smart-Scientific-Reader"
depends=()
license=('custom')
provides=('HammerPDF')
source=("https://github.com/HammerPDF/Smart-Scientific-Reader/releases/download/v${pkgver}/Hammer.PDF-linux-${pkgver}.deb")

sha256sums=('4967ffa6cd9417d5523471193f36dcf9083432686ee09f42485eb8d27cfcf910')

package() {
	tar -xf data.tar.xz -C "${pkgdir}"
}
