# Maintainer: Cédric Connes <cedric.connes@gmail.com>
pkgname=tarsum
pkgver=0.1.1
pkgrel=1
pkgdesc="Compute checksums from tar archives on-the-fly"
arch=('any')
url="https://github.com/connesc/tarsum"
license=('ISC')
depends=()
source=("https://github.com/connesc/tarsum/archive/v${pkgver}.tar.gz")
sha256sums=('ce4e96e7fd1ca343cbb9d21acfae017b9b5994081022fda5b3eed50c9c0fb17a')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 tarsum "${pkgdir}/usr/bin/tarsum"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
