# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergio Montesinos <sermonpe@yahoo.es>

pkgname=rosa-icons
pkgver=1.1.20
pkgrel=1
pkgdesc="ROSA icons theme."
arch=('any')
url="http://www.rosalinux.com"
license=('GPL')
depends=('gnome-icon-theme')
makedepends=('inkscape')
install=rosa-icons.install
source=("http://mirror.yandex.ru/rosa/rosa2016.1/repository/SRPMS/main/updates/${pkgname}-${pkgver}-4.src.rpm")
md5sums=('be93ea0fe94dc7cd6c7e6536c0d8180e')
package() {
  install -dm755 "${pkgdir}/usr/share/icons/rosa"
  bsdtar --no-same-owner --strip-components 1 -xzf "${srcdir}/rosa-icons-devel-v${pkgver}.tar.gz" -C "${pkgdir}/usr/share/icons/rosa"
}
