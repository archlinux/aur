#Maintainer: Plague-doctor <plague <at>> privacyrequired <<dot>> com >

pkgname=xerox-docuprint-cp405
pkgver=1.0.7
pkgrel=1
pkgdesc="Drivers for Fuji Xerox DocuPrint CP405 Printer (Optimized for faster printing)."
url="http://www.fujixerox.com/eng/"
license=('custom')
arch=('any')
depends=('cups')
source=('Xerox_DocuPrint_CP405_d.ppd'
        'Xerox_DocuPrint_CP405_d_optimized.ppd')

sha256sums=('364e792454810539f4e4eae6f817781bfc7596dfbae63dd310aade66068a66bd'
            'c65113d351f54f100ff3703bd100a90a0f286c01306cb58e33c13aa271966d89')

validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

package() {
  # install all PPD files (original and optimized)
  mkdir -p "${pkgdir}"/usr/share/cups/model/Xerox
  install -m644 Xerox_DocuPrint_CP405_d.ppd "${pkgdir}"/usr/share/cups/model/Xerox
  install -m644 Xerox_DocuPrint_CP405_d_optimized.ppd "${pkgdir}"/usr/share/cups/model/Xerox
}
