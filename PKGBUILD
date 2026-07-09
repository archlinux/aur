# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='A modern ls with useful tables'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('98bcc0afc41901a0c23c289e3c31e9d82d61d5515b586b739714ea3ab1324d3e')
sha256sums_aarch64=('7bde975994a26d6d58f2639742eb6277df4f2ede28175e9797d99a5bca5322ca')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
