# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Nushell-style ls for bash, zsh, and fish'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d0f2d9e40e58238a56026914320ce4cbf11153d1e44d7073432aa90a0d76555f')
sha256sums_aarch64=('6d4b191b5eba7f917a4798162775e55c341adfd4b4fa4d6d1457496c642489ec')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
