# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=pdf-compress
pkgver=2.0.4
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
b2sums=('9346140bbdf0f25eb735fcb863f00b500e393fe20fadf660f9ba635b82f0f18c54110393be6cff20d135b31316f6ad46d5f8810d24a9726ed6a43a964858efc6')

package() {
  install -Dm755 $pkgname-$pkgver.sh "$pkgdir"/usr/bin/$pkgname
}
