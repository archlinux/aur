# Maintainer: funnes <johannes.neyer at gmail dot com>

pkgname=nrfutil
pkgver=8.2.0 
pkgrel=1
pkgdesc="unified command line utility for Nordic products"
arch=("x86_64")
url="https://www.nordicsemi.com/Products/Development-tools/nRF-Util"
license=("custom")
optdepends=("jlink-software-and-documentation: for some commands (e.g. device)")
source=("https://files.nordicsemi.com/ui/api/v1/download?repoKey=swtools&path=external/nrfutil/packages/nrfutil/nrfutil-${arch}-unknown-linux-gnu-${pkgver}.tar.gz")
sha256sums=("fabe84198efe045a7cdcc9d5132669c1bc2cb168f61db93f2261ae4fd980e73f")

package() {
  cd "${srcdir}/nrfutil-${arch}-unknown-linux-gnu-${pkgver}/data/"
  install -Dm755 bin/nrfutil "${pkgdir}/usr/bin/nrfutil"
}
