# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=pdf-compress
pkgver=1.7
pkgrel=2
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
b2sums=('f18e9dfe48abc64e56bff899c95cdc969580d9ea02457888aa0ecf9b4290924dc33cf6e7998b3c0700a226806a02f8d5bfbc512fb4ca201dc9685e797be0ef41')

package() {
  install -Dm755 "${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
