# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pdf-compress
pkgver=1.0
pkgrel=1
pkgdesc='Compress an overlarge pdf file'
arch=('any')
url='https://www.timedicer.co.uk/programs/help/pdf-compress.sh.php'
license=('APACHE')
depends=('ghostscript' 'imagemagick')
source=("${pkgname}-${pkgver}::https://www.timedicer.co.uk/programs/${pkgname}.sh")
sha256sums=('bcb4b1445490e682cddcd63bbbee3f73b37defbe139ede0d6bd37b2d2d8f8e7a')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
