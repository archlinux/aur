# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=pdf-compress
pkgver=1.7
pkgrel=3
pkgdesc='Compress an overlarge pdf file'
arch=("any")
url='https://www.timedicer.co.uk/programs/help/pdf-compress.sh.php'
license=("APACHE")
depends=(
  "ghostscript"
  "imagemagick"
)
optdepends=(
  "qpdf: further 10% compression or slightly better quality"
  "perl-image-exiftool: used to update the metadata in the destination file"
)
source=("${pkgname}-${pkgver}.sh::https://www.timedicer.co.uk/programs/${pkgname}.sh")
b2sums=('828c97ad2c3feef57fc24266e565f1eb9bf2161437905be9c168dbab63923203136463fa799617f98b9bb46028b440d0cd858243d585a9a63dd2424b2045897b')

package() {
  install -Dm755 "${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
