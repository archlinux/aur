# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.1.3
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('797aacd713da066bb0f754b201cdeec9312aaa7975bf8162fce121ceeee86dcf')
sha256sums_armv7h=('d4898aa21093f38f1fdf8f97efe7babd0f17a48b94d397fcec7a5e42faadcd79')
sha256sums_aarch64=('8c08e88d007025880bc4c8648e2890704f19f3c677ee67d3d0dfafdd75de817a')

package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
