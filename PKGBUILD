# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.1.7
pkgrel=1
pkgdesc='Nushell-style ls for bash, zsh, and fish'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('66f22be75842eabc880674c5c262c6e8763330054708b606ba0c43282191c52f')
sha256sums_aarch64=('dc8827c7f1bef19ed2d43939a9eefd102fa5639e4dd838308583f9708493a09b')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
