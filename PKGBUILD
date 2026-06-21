# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Nushell-style ls for bash, zsh, and fish'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('01f2999650c9865c7f7f7ebde87981b845cad3d43c6cf837a9d5e4a6ac065a54')
sha256sums_aarch64=('6124a84963baae352bcd3f43c43d0c7a15c917f59a81a0f023ee6841a534c698')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
