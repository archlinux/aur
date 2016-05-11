#Maintainer: Plague-doctor <plague <at>> privacyrequired <<dot>> com >

pkgname=xerox-docuprint-cp405
pkgver=1.0.5
pkgrel=1
pkgdesc="Drivers for Fuji Xerox DocuPrint CP405 Printer."
url="http://www.fujixerox.com/eng/"
license=('custom')
arch=('any')
depends=('cups')
source=('Xerox_DocuPrint_CP405_d.ppd')

sha256sums=('364e792454810539f4e4eae6f817781bfc7596dfbae63dd310aade66068a66bd')

validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

package() {
  # install all PPD file
  mkdir -p "${pkgdir}"/usr/share/cups/model/Xerox
  install -m644 Xerox_DocuPrint_CP405_d.ppd "${pkgdir}"/usr/share/cups/model/Xerox
}
