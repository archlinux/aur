# Maintainer: Sergey Balabanov <sergey dot balabanov at gmail dot com>
pkgname=aqua-bin
pkgver=2.30.0
pkgrel=1
pkgdesc="Declarative CLI Version manager written in Go. Pre-compiled."
arch=('x86_64' 'aarch64')
url="https://github.com/aquaproj/aqua"
license=('MIT')
depends=()
optdepends=()
provides=('aqua')
install=aqua-bin.install

source_x86_64=("https://github.com/aquaproj/aqua/releases/download/v${pkgver}/aqua_linux_amd64.tar.gz")
source_aarch64=("https://github.com/aquaproj/aqua/releases/download/v${pkgver}/aqua_linux_arm64.tar.gz")

sha256sums_x86_64=('933f4eff665f268b461e9897098c9ebbd10ca3b9277a901670e129226f434ec0')
sha256sums_aarch64=('18fc75c57300c42144c4262bb807277d0c5f32685a0e49489da31c46fc8e03e0')

package() {
  install -Dm755 "${srcdir}/aqua" "${pkgdir}/usr/bin/aqua"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
