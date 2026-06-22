# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.1.6
pkgrel=1
pkgdesc='Nushell-style ls for bash, zsh, and fish'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5dfb5ccc83734ea9e163ddc8fc4371a618bbb0a31dee205f77abc5038cba06a4')
sha256sums_aarch64=('652a3a87483a7f8b7cceaab7e82f8ce3fa79becac95f3ddb50fa34a994c58a56')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
