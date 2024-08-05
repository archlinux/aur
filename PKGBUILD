# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.1.5
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('46b01729a7a660340fa0350911451dd8080bb3ba5d0c6b1a7612fc62d1f73022')
sha256sums_armv7h=('dfd8188c0fcff0b3001d697391b2786a46ef946055b1df09752e56528329b3d2')
sha256sums_aarch64=('4487e88260205e6513f09629c5ef28807c68c3d4f6b8a24c801482a29c0b435e')

package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
