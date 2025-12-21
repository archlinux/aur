# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=pdf-compress
pkgver=2.0.3
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
b2sums=('9cf5d23fa7a8bb2ddddf1ba4b41618ea95f9afa34cf1a140c46ff210fbbbac53c231dee46b2aebda5e730e01f5e16decc584229f80a55514956fd9f2063e857b')

package() {
  install -Dm755 $pkgname-$pkgver.sh "$pkgdir"/usr/bin/$pkgname
}
