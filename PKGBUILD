# Contributor: EEva <eeva+aur@marvid.fr>
# Based on package by: Thomas Kinnen <thomas.kinnen@gmail.com>

pkgname=ppd-toshiba-estudio5560c
provides=('ppd-toshiba-estudio347cs'
          'ppd-toshiba-estudio407cs'
          'ppd-toshiba-estudio2050c'
          'ppd-toshiba-estudio2550c'
          'ppd-toshiba-estudio2040c'
          'ppd-toshiba-estudio2540c'
          'ppd-toshiba-estudio3040c'
          'ppd-toshiba-estudio3540c'
          'ppd-toshiba-estudio4540c'
          'ppd-toshiba-estudio2555c'
          'ppd-toshiba-estudio3055c'
          'ppd-toshiba-estudio3555c'
          'ppd-toshiba-estudio4555c'
          'ppd-toshiba-estudio5055c'
          'ppd-toshiba-estudio5540c'
          'ppd-toshiba-estudio6540c'
          'ppd-toshiba-estudio6550c'
          'ppd-toshiba-estudio5560c'
          'ppd-toshiba-estudio6560c'
          'ppd-toshiba-estudio6570c')
pkgdesc="Printer only driver for the Toshiba e-STUDIO class of printers"
url="http://www.eid.toshiba.com.au/n_driver_ebx_colour.asp"
pkgver=1.0
pkgrel=4
arch=('i686' 'x86_64')
license=('Propietary')
depends=('cups')
source=('http://www.eid.toshiba.com.au/drivers/eBX/eBX_CUPS_Colour_V7.22.zip')
install='ppd-toshiba-estudio5560c.install'
md5sums=('2e450664cf34c8c4aed92fb76bf82d2d')

package() {
  cd ${pkgdir}
  tar xf ${srcdir}/eBX_CUPS_Colour_V7.22/normal/TOSHIBA_ColorMFP_CUPS.tar
}

