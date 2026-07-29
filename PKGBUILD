# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=2.0.2
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('9c8ea7caa43f3b07285d4e473289efb52471bd769db512a55be7a166e7a46636')
sha256sums_armv7h=('f64a77ff9335725c21aa8f49bd82fbaf9d897268dfbda4d45d50722a00658ce2')
sha256sums_aarch64=('156c5f12c44d8af2af094290f3c855d687933bc889c415a55c2c755942073018')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
