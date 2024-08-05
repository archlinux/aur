# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.1.7
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('953dc2dccc2555a353aeef566bdb719b73bf2542e94db308c63ead6b7c516044')
sha256sums_armv7h=('084e4a5f439332891f59b1da22312ef0f5bea69ed2464759c136a8f880bc9668')
sha256sums_aarch64=('4910ddc77eed28ae22dbe026e5e20830f5f30b8b439a57c209a82fb8995f7bd6')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
