# Maintainer: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>

pkgname=envscale
pkgver=0.2.0
pkgrel=1
pkgdesc="Sets several HiDPI scaling environment variables before running a command"
arch=("any")
url="https://github.com/electrickite/${pkgname%-git}"
license=("MIT")
depends=("gtk3")
source=("https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("46dcee137b799da463d4d835cdb1c15ad200a769ee5ce643186ac32e864ae7d4")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
