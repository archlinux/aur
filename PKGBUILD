# Maintainer: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>

pkgname=batsignal
pkgver=1.1.2
pkgrel=1
pkgdesc="A lightweight battery monitor daemon"
arch=("any")
url="https://github.com/electrickite/${pkgname%-git}"
license=("ISC")
depends=("libnotify")
source=("https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("00cb30df33b5fee049963657f341e963a0f094dbf1620397bf1e56fa07191e7c")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
