# Maintainer: Adrian Room <ingolemo@gmail.com>

pkgname=ttf-tengwar-formal-csur
pkgver=1.1
pkgrel=1
pkgdesc="A conversion of Tengwar Formal to the CSUR character mapping"
license=("custom:ofl")
arch=("any")
url="https://freetengwar.sourceforge.net/formal.html"
source=(
  "$pkgname-$pkgver.zip::http://sourceforge.net/projects/freetengwar/files/TengwarFont/TengwarFormalCSUR11.zip/download"
)
sha256sums=('924c282f7f967ecf6ca81003d95d4355dcccda9cf3fb7afdc746cb9d8f8250c7')

package() {
	install -d "${pkgdir}/usr/share/fonts/TTF"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" TengwarFormalCSUR11/TengwarFormalCSUR.ttf
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" TengwarFormalCSUR11/OFL.txt
	install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/README" TengwarFormalCSUR11/FontLog.txt
}

