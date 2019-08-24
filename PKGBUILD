# Maintainer: Victor Trac <victor.trac@gmail.com>

pkgname=brother-mfcj835dw-lpr-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="LPR driver for Brother MFC-J835DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/downloadlist.aspx?c=us&lang=en&prod=mfcj835dw_us&os=128"
license=("EULA")
depends=("cups" "cups-filters")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf006630/mfcj835dwlpr-3.0.1-1.i386.deb")
md5sums=("a04745cfcc2dc529c9b9397f638c5bb5")

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  mkdir -p "${pkgdir}/usr/lib/cups/filter/"
  ln -s "/opt/brother/Printers/mfcj835dw/lpd/filtermfcj835dw" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfcj835dw"
}
