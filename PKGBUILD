# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.1.6
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('92c578533aff9323c4aa49143206e22c83a936db637c2131d0d10a296de30332')
sha256sums_armv7h=('23bf1c06f2eaf0f2557a565fdba0c41e3ab4108a4701618cef05521de43c11a6')
sha256sums_aarch64=('dea0cdb0846b172f0560952baa0a57215e039ba581a2b52e0a1845ffedae8b5f')

package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
