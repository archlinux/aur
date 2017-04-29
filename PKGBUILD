# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname='openprinting-ppds-postscript-savin'
pkgver='20161206'
pkgrel='1'
pkgdesc="PPD files for Ricoh Savin Postscript printers, supplied by Ricoh"
arch=('any')
url='http://www.openprinting.org/driver/Postscript-Savin/'
license=('MIT')
depends=('cups' 'ghostscript')
depends+=('cups-filters') # foomatic-rip
conflicts=('ppd-ricohh')
source=("http://www.openprinting.org/download/printdriver/components/lsb3.2/main/RPMS/noarch/${pkgname}-${pkgver}-1lsb3.2.noarch.rpm")
sha256sums=('9b11368d1f4949d31d544ce02e8684b1ae862656f5a48bd99a65d674765ab9d1')

package() {
  install -D "${srcdir}/opt/OpenPrinting-Ricoh/ppds/Savin"/* -t "${pkgdir}/usr/share/cups/model/Savin/"
  install -D "${srcdir}/opt/OpenPrinting-Ricoh/doc/${pkgname}"/* -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
