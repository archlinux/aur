# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.6.13
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('beef925bd430603371104fb2bcbde4876cef2a23057881e039f40310dc0ddb83')
sha256sums_armv7h=('052f1de3b4416abdd98276c39c1ad8f0a6f3ec495b9c5b7e5e34d5a0db2e3ed8')
sha256sums_aarch64=('7e4c3da4b21212baf18126c79f28e9492ed013800031d440071a03bb67e38bdb')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
