# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergio Montesinos <sermonpe@yahoo.es>

pkgname=rosa-icons
pkgver=1.1.6
pkgrel=1
pkgdesc="ROSA icons theme."
arch=('any')
url="http://www.rosalinux.com"
license=('GPL')
depends=('gnome-icon-theme')
makedepends=('inkscape')
install=rosa-icons.install
source=("http://mirror.yandex.ru/rosa/rosa2014.1/repository/SRPMS/main/updates/${pkgname}-${pkgver}-3.src.rpm")
md5sums=('827d5e77cae7a02a9a49195289dd4af0')
package() {
  install -dm755 "${pkgdir}/usr/share/icons/rosa"
  bsdtar --no-same-owner --strip-components 1 -xzf "${srcdir}/rosa-icons-devel-v${pkgver}.tar.gz" -C "${pkgdir}/usr/share/icons/rosa"
}
