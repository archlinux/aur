# Contributor: EEva <eeva+aur@marvid.fr>
# Based on package by: Thomas Kinnen <thomas.kinnen@gmail.com>

pkgname=ppd-toshiba-estudio5560c
provides="ppd-toshiba-estudio5560c"
pkgdesc="Printer only driver for the Toshiba e-STUDIO 5560c (and at least one other)"
url="http://www.eid.toshiba.com.au/n_driver_ebx_colour.asp"
pkgver=1.0
pkgrel=2
arch=('i686' 'x86_64')
license=('Propietary')
depends=('cups')
#makedepends=('unzip')
source=('http://www.eid.toshiba.com.au/drivers/eBX/eBX_CUPS_Colour_V7.22.zip')
install='ppd-toshiba-estudio5560c.install'
md5sums=('2e450664cf34c8c4aed92fb76bf82d2d')

package() {
  cd ${pkgdir}
  tar xf ${srcdir}/eBX_CUPS_Colour_V7.22/normal/TOSHIBA_ColorMFP_CUPS.tar
}

