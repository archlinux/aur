# Maintainer: semo <semox78@gmail.com>
pkgname=europlate.ttf
pkgver=1.0
pkgrel=1
pkgdesc="EuroPlate - TrueType Font for european number plates."
arch=('any')
url="http://www.autokennzeichen.info/kennzeichen-schriftart.htm"
license=('MIT')

source=("http://www.autokennzeichen.info/files/EuroPlate.ttf")

md5sums=('97a834894e9186114b53cb801f73c18b')

package() {
	cd "$srcdir"
        install -dm755 "${pkgdir}/usr/share/fonts/EuroPlate"
        install -Dm644 EuroPlate.ttf -t "${pkgdir}/usr/share/fonts/EuroPlate"
}
