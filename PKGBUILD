# Maintainer: Nichlas Severinzen <ns@nsz.no>

pkgname=xr0
pkgver=0.15.1
pkgrel=1
pkgdesc="A verifier for C that aims to guarantee the safety of C programs at compile time"
arch=("any")
url="https://github.com/xr0-org/xr0"
license=("Apache-2.0")
makedepends=("gcc" "git" "make")
provides=("xr0")
source=("https://github.com/xr0-org/xr0/archive/refs/tags/v${pkgver}.zip")
sha256sums=("SKIP")

build() {
  cd "${srcdir}/xr0-${pkgver}"
  make
}

package() {
  cd "${srcdir}/xr0-${pkgver}"
  install -Dm755 bin/0v "${pkgdir}/usr/bin/0v"
}


