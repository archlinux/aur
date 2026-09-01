# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=pdf-compress
pkgver=2.1.1
pkgrel=1
pkgdesc="Compress an overlarge pdf file"
arch=(any)
url="https://www.timedicer.co.uk/programs/help/pdf-compress.sh.php"
license=(Apache-2.0)
depends=(
  ghostscript
  imagemagick
)
optdepends=(
  "qpdf: further 10% compression or slightly better quality"
  "perl-image-exiftool: used to update the metadata in the destination file"
)
source=($pkgname-$pkgver.sh::https://www.timedicer.co.uk/programs/$pkgname.sh)
b2sums=('68c2a8408554e548a7c6619bfe4a865910cd3bd0a334a43a0ea512dc78d7ee22c27b65f57ebe4a24ccb7ebfde5a108527937346a3c1b30cf48a149a1acaed6c7')

package() {
  install -Dm755 $pkgname-$pkgver.sh "$pkgdir"/usr/bin/$pkgname
}
