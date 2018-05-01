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
          'ppd-toshiba-estudio4505ac'
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
pkgver=7.89
pkgrel=1
arch=('any')
license=('Propietary')
depends=('cups')
source=('http://business.toshiba.com/downloads/KB/f1Ulds/15178/TOSHIBA_ColorMFP_CUPS.tar')
install='ppd-toshiba-estudio5560c.install'
sha256sums=('9938e9adda645ad353c5b34719961cff8af8b0b3588ded886b0ac452f0c9e463')

package() {
  cd ${srcdir}
  # This two files will be installed
  # usr/lib/cups/filter/est6550_Authentication
  # usr/share/cups/model/Toshiba/TOSHIBA_ColorMFP_CUPS.gz
  cp -av usr ${pkgdir}/
}

