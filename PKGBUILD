# Maintainer: Malte Jürgens <maltejur@dismail.de>
pkgname=brother-dcpj1200wpdrv-bin
pkgver=3.5.0
pkgrel=1
pkgdesc="Printer driver for Brother DCP-J1200W(E) printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/downloadend.aspx?c=eu_ot&lang=en&prod=dcpj1200w_eu_as&os=128&dlid=dlf105287_000&flang=4&type3=10283"
license=("EULA")
source=("https://download.brother.com/welcome/dlf105287/dcpj1200wpdrv-3.5.0-1.i386.deb")
sha256sums=("2da5880899774cf2e317ca4edd2367ba909164d2b103cd1105adefa436d0bc0f")
package() {
  tar -xf data.tar.gz -C "${pkgdir}"
}
