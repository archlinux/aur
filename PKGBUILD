# Maintainer: Jesse Lin <dawnatcma(at)gmail(dot)com>
pkgname=pacnanny
pkgver=1.3.2
pkgrel=1
pkgdesc="Yet another wrapper script for Pacman"
arch=('any')
url="https://github.com/brandoninvergo/pacnanny"
license=('GPL')
depends=('bash')
source=("https://github.com/brandoninvergo/pacnanny/archive/v1.3.2.tar.gz")
md5sums=('7db8732e3609fa2dc29c5dfe76fc57c4')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "pacnanny" "${pkgdir}/usr/bin/pacnanny"
  install -Dm644 "pacnanny.conf" "${pkgdir}/etc/pacnanny.conf"
}
