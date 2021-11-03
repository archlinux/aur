# Maintainer: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>

pkgname=batsignal
pkgver=1.3.0
pkgrel=1
pkgdesc="A lightweight battery monitor daemon"
arch=("any")
url="https://github.com/electrickite/${pkgname%-git}"
license=("ISC")
depends=("libnotify")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("2c2b6bbc45f4287c70cde301c8ad7d8070c260075bbb3c68324d3821890e46e4")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
