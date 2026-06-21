# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Nushell-style ls for bash, zsh, and fish'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('34a5d1dde07b0b094c87a9fbaa612603d21c7d665a8bb33f37cbb501a040fd06')
sha256sums_aarch64=('61fdea96bdce2221f1f40e32e2de456fe029ae294082ef99368d1bb553a9cc35')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
