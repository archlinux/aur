# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=pdf-compress
pkgver=1.8
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
b2sums=('ec865a7d9a8206803eb0955d5c520c7619a491ca6a22059ccdfbefbb3f348ae061988cece532a7494865892b33ea1e7017376bbfe91e9a780f1c6cebdaf45b8d')

package() {
  install -Dm755 "${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
