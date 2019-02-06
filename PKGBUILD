# Maintainer: Alfredo Palhares <alfredo@palhares.me>

# Please contribute to:
# https://github.com/masterkorp/nexus-cli-bin-pkgbuild

pkgname=nexus-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Nexus CLI for Docker Registry v2 - Prebuilt Binary"
arch=("x86_64" "i686")
makedepends=("")
provides=("nexus-cli")
url="https://github.com/mlabouardy/nexus-cli"
license=("MIT")
source=("https://s3.eu-west-2.amazonaws.com/nexus-cli/${pkgver}-beta/linux/nexus-cli")
sha256sums=('942e2d96720e5aba1183f47ecd5f63260e04d4a518d239e662e16fc6e3cb9b2c')

package() {
  mkdir -p ${pkgdir}/usr/bin

  cd ${srcdir}
  install -m755 ${srcdir}/nexus-cli "${pkgdir}/usr/bin/nexus-cli"
}
