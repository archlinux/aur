# Maintainer: Phuwit Puthipairoj <26784267+phuwit@users.noreply.github.com>
pkgname=brother-mfcj2330dw-cups-bin
pkgver=1.0.1
pkgrel=0
pkgdesc="CUPS driver for Brother MFC-J2330DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=th&lang=en&prod=mfcj2330dw_eu_as_cn"
license=("EULA")
source=("https://download.brother.com/welcome/dlf103035/mfcj2330dwcupswrapper-$pkgver-$pkgrel.i386.deb")
sha256sums=("184b21636654959ced6ed385bd98892904a867f707ab4e43226df35903cd12b5")
package() {
    tar -xf data.tar.gz -C "${pkgdir}"
}