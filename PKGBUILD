# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='A modern ls with useful tables'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ac9877cfee7d27b7707921d049ff0ef80f537e19f88ca46c3c52c989e3a3a29d')
sha256sums_aarch64=('01dc9dce95ee04e357bb7cfea0bb8bb21cb07d89ca4d4df0dafc966f203464d3')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
