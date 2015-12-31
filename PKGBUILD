# Maintainer: Tomáš Mládek <tmladek [on] inventati [bop] org>
# Contributor: Chris <christopher.r.mullisn g-mail>

pkgname=3dslicer
pkgver=4.5.0
pkgrel=2
pkgdesc="A free, open source software package for image analysis and scientific visualization."
url="http://slicer.org"
arch=('x86_64')
license=('BSD')
depends=('glu')
source=("Slicer-$pkgver-linux-amd64.tar.gz::http://download.slicer.org/bitstream/461634")
sha512sums=('c41dbf0248a07fceee1040cf58a7f6b08e7bec7cc306138663d736e6fd2a02545828655d44df346000805102ad4f1947e5d1e301371a652984545079ae511226')

package() {
  install -d "$pkgdir"/opt/3dslicer "$pkgdir"/usr/bin
  mv "$srcdir/Slicer-$pkgver-1-linux-amd64/"* "$pkgdir/opt/3dslicer"
  ln -s /opt/3dslicer/Slicer "$pkgdir/usr/bin"
}
