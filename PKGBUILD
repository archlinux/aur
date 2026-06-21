# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='Nushell-style ls for bash, zsh, and fish'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('8af7c35aafe201773b1ad641cfb81fdb39581eeaae26e594b4d38feadfcf5460')
sha256sums_aarch64=('0cef4229514d041f08fd048f2e3cbd51037abf1b0419411e3f325c8d85de9ecc')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
