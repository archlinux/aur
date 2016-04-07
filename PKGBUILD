# Maintainer: Devin Christensen <quixoten@gmail.com>
pkgname=ppd-dell-b2375dfw
pkgver=A00
pkgrel=1
pkgdesc="CUPS Printer Driver for Dell B2375dfw"
arch=("any")
url="http://www.dell.com/support/home/us/en/19/product-support/product/dell-B2375dfw/drivers?os=ln90"
license=("custom")
source=("http://downloads.dell.com/FOLDER01816495M/1/Printer_B2375_Driver_Dell_${pkgver}_Linux.tar.gz")
md5sums=('46de00a5cf7856eac33800dd61a6ed26')

package() {
  cd "cdroot/Linux/noarch"

  install -D -m644 \
    "eula/eula.htm" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m644 \
    "at_opt/share/ppd/Dell_B2375dfw_Mono_MFP.ppd" \
    "${pkgdir}/usr/share/ppd/cupsfilters/Dell_B2375dfw_Mono_MFP.ppd"
}
