# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=pdf-compress
pkgver=1.9.1
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
b2sums=('2c83b8abf6b444b674cf14b177634b2f0c374b70ad37a2ce8ed21302b429721b1363c647cd0463d13c85626dea1472ae6e608937b8ce0603197e6fbdb8223805')

package() {
  install -Dm755 "${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
