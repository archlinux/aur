
# Maintainer: James Bulmer <me@nekinie.com>
# Maintainer: Victor Häggqvist <aur a snilius d com>

pkgname=migrate
pkgver=4.6.2
pkgrel=1
pkgdesc="Database migration handling"
url="https://github.com/golang-migrate/migrate"
arch=("x86_64")
license=("MIT")
source_x86_64=("https://github.com/golang-migrate/migrate/releases/download/v${pkgver}/migrate.linux-amd64.tar.gz")
sha256sums_x86_64=("bf68db05bf8490c7960dc6ce5d2e60462a42baec207859282e8663f447ab31dd")

package() {
  install -d "${pkgdir}/usr/bin"
  mv "${srcdir}/migrate.linux-amd64" "${pkgdir}/usr/bin/migrate"
}
