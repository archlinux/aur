# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gps2photo
pkgver=1.160
pkgrel=1
pkgdesc="Geotags digital photos by using GPS track data recorded at the same time"
arch=('any')
url="http://www.carto.net/projects/photoTools/gpsPhoto/"
license=('GPL')
depends=('perl-image-exiftool' 'perl-xml-parser')
source=(http://gps2photo.cvs.sourceforge.net/*checkout*/$pkgname/gpsPhoto/src/gpsPhoto.pl)
sha256sums=('d202bc00a70317dd3cafce7c2a9d770ac1c7071dd18a2e001693c5e492af98af')

package() {
  cd "${srcdir}"

  install -Dm755 gpsPhoto.pl "${pkgdir}"/usr/bin/gpsPhoto.pl

  cd "${pkgdir}"/usr/bin/
  ln -s gpsPhoto.pl $pkgname
}
