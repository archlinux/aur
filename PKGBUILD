# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=pdf-compress
pkgver=1.9.3
pkgrel=2
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
b2sums=('e22c1415bb38534f3b8286a00eee4664f13eaf71e8b8e3baa3af9e97d7fc39c84882f69b40745c55ff3c4bfca5ed44a760832a8708ea6c059f43d69f8f9f141e')

package() {
  install -Dm755 $pkgname-$pkgver.sh "$pkgdir"/usr/bin/$pkgname
}
