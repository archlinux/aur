# Maintainer: Guoyi
pkgname=gffread
pkgver=0.12.7
pkgrel=1
pkgdesc="GFF/GTF utility providing format conversions, region filtering, FASTA sequence extraction and more"
arch=('x86_64')
url="https://github.com/gpertea/gffread"
license=('MIT')
depends=()
makedepends=('make')
optdepends=()
source=(https://github.com/gpertea/gffread/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('6f3417090b3beb74f435bf5d462c87475b3c704a8a0d71821f6c1321c47dbbbe')
build() {
  cd "${pkgname}"-$pkgver
  make release
}

package() {
  cd "${pkgname}"-$pkgver
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname


}
