# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.5.1
pkgrel=1
pkgdesc='Nushell-style ls for bash, zsh, and fish'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e73ea40ce9c77b72301b868b8250b3dec2a0413bb9b0f8502404ecb476fc092c')
sha256sums_aarch64=('8ca12b9d3952609180180e275d8b3888e9a5ce40c0f38bd6fde993be77592cb3')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
