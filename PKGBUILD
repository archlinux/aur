# Maintainer: Shervin Khastoo <shervinkh145@gmail.com>

pkgname=toshiba-estudio355
pkgdesc="Printer only driver for the Toshiba e-STUDIO 255/305/355/455 printers"
url="https://www.toshiba-business.com.au/support/drivers/"
pkgver=7.85
pkgrel=1
arch=('i686' 'x86_64')
license=('Propietary')
depends=('cups')
source=('https://dl.toshiba-business.com.au/drivers/eBN/eBN_CUPS_Mono_V7.58.zip')
md5sums=('87de33e4ba648b62f33680dcb2830948')

package() {
  cd ${pkgdir}
  tar xf ${srcdir}/eBN_CUPS_Mono_V7.58/normal/TOSHIBA_MonoMFP_CUPS.tar
}
