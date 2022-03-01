# Maintainer: Justin Holz <jholz88@arcaneventures.llc>
pkgname=brother-hl3140cw-cups-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="CUPS wrapper for Brother HL-3140CW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=hl3140cw_us_eu"
license=("EULA")
provides=('brother-hl3140cw')
conflicts=('brother-hl3140cw')
depends=(
	'brother-hl3140cw-lpr-bin'
	'cups'
)
groups=("base-devel")
install=brother-hl3140cw-cups-bin.install
source=("https://download.brother.com/welcome/dlf007070/hl3140cwcupswrapper-1.1.4-0.i386.deb")
md5sums=("2b7e8d7d9685599d8e5955fc4636b967")
package() {
       tar -xf data.tar.gz -C "${pkgdir}"
}
