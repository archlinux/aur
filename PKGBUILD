pkgname=bt-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Interactive tree-like terminal file manager"
url="https://github.com/LeperGnome/bt"
license=(MIT)
arch=(x86_64 aarch64)

source_x86_64=("https://github.com/LeperGnome/bt/releases/download/v${pkgver}/bt-linux-amd64.tar.gz")
source_aarch64=("https://github.com/LeperGnome/bt/releases/download/v${pkgver}/bt-linux-arm64.tar.gz")

sha256sums_x86_64=("97201bc57c42bddec9a622ac906cc3d5315922e3c5d76db95a65c969b3f9ac7f")
sha256sums_aarch64=("aaad48ae23eb2afb241b4c4cad88233fb57af7b54a9590abdda623f1daeeb516")

package() {
  install -Dm755 "${srcdir}/bt" "${pkgdir}/usr/bin/bt"
}

