# Maintainer: Filip Gralinski <filipg@ceti.pl>

pkgname=brother-dcpl8410cdw-cups-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="CUPS wrapper for Brother DCP-L8410CDW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcpl8410cdw_eu"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf103248/dcpl8410cdwcupswrapper-1.5.0-0.i386.deb")
md5sums=("efc8971290459402de7950dee79c4d23")

package() {
    tar -xf data.tar.gz -C "${pkgdir}"
    mkdir -p "${pkgdir}"/usr/lib/cups/filter
    ln -s /opt/brother/Printers/dcpl8410cdw/cupswrapper/brother_lpdwrapper_dcpl8410cdw \
       "${pkgdir}"/usr/lib/cups/filter/brother_lpdwrapper_dcpl8410cdw
}
