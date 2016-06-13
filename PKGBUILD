# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergio Montesinos <sermonpe@yahoo.es>

pkgname=rosa-icons
pkgver=1.1.8
pkgrel=1
pkgdesc="ROSA icons theme."
arch=('any')
url="http://www.rosalinux.com"
license=('GPL')
depends=('gnome-icon-theme')
makedepends=('inkscape')
install=rosa-icons.install
source=("http://mirror.yandex.ru/rosa/rosa2014.1/repository/SRPMS/main/updates/${pkgname}-${pkgver}-1.src.rpm")
md5sums=('7deae69a57623edee33e03bfa1752450')
package() {
  install -dm755 "${pkgdir}/usr/share/icons/rosa"
  bsdtar --no-same-owner --strip-components 1 -xzf "${srcdir}/rosa-icons-devel-v${pkgver}.tar.gz" -C "${pkgdir}/usr/share/icons/rosa"
}
