# Maintainer: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>

pkgname=batsignal
pkgver=1.1.3
pkgrel=1
pkgdesc="A lightweight battery monitor daemon"
arch=("any")
url="https://github.com/electrickite/${pkgname%-git}"
license=("ISC")
depends=("libnotify")
source=("https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("d4befc2daaeaba71e63af40b7bc869eef2ece996f9f42fbb2026268efcc0e547")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
