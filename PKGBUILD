# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=pdf-compress
pkgver=1.9
pkgrel=1
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
b2sums=('c24f86a0d0ed7b67762363f6019000152bf563f1bdb2716932137d6c7dcdfb787d0ccfaf177c746228faa9d532fc978a99f194df3e6dcfa229412ede5fc75953')

package() {
  install -Dm755 "${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
