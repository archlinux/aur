# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=2.0.8
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('cf016a9fa19124f1932c1d73435e68e398bae15d6d5c3fef9688a22df61f7aba')
sha256sums_armv7h=('6a6aaaf52a20b5eafb3be0b594c6cefa743fee46408d20ce6ba4b74c788a7ea7')
sha256sums_aarch64=('e689a68f34d32ba929841473c5b9f3f8328355bdd9b612cfc83f9564aeaa0508')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
