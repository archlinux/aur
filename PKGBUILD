# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname='pdf-compress'
pkgver=0.6
pkgrel=1
pkgdesc='Compress an overlarge pdf file'
arch=('any')
url='https://www.timedicer.co.uk/programs/help/pdf-compress.sh.php'
license=('APACHE')
depends=('ghostscript' 'imagemagick')
source=("${pkgname}-${pkgver}::https://www.timedicer.co.uk/programs/${pkgname}.sh")
sha256sums=('88eed80fe28e6fdf111accf1d4b1d22836f75ec53b103b614b6fbb539f926ab7')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
