# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=pdf-compress
pkgver=2.0.0
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
b2sums=('536ed151dfe3704b0fc667534162acd84ce8073b7713e5bdd761b661265ddaba9f956a13f4f41a3a257f020ae480abd1784817daf7401aea5f50cceecd6861e2')

package() {
  install -Dm755 $pkgname-$pkgver.sh "$pkgdir"/usr/bin/$pkgname
}
