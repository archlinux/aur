# Maintainer: Bebbssos
# Template — placeholders (0.1.0 / @SHA256_*@) are filled in by
# pkg/aur/render.sh at release time. Do not edit the rendered output by hand;
# edit this file and let the release workflow re-render it.
pkgname=ixr-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Unofficial Rust port of the Internxt CLI (faster, single static binary, streaming transfers)"
arch=('x86_64' 'aarch64')
url="https://github.com/Bebbssos/internxt-cli-rust"
license=('MIT')
provides=('ixr')
conflicts=('ixr')

source_x86_64=("https://github.com/Bebbssos/internxt-cli-rust/releases/download/v${pkgver}/ixr-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/Bebbssos/internxt-cli-rust/releases/download/v${pkgver}/ixr-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('0fb9135090cf47e4eb9b3bfa19e05e6f28aa03f4c8b9ab7892bf42413e9ab22d')
sha256sums_aarch64=('26d6b31fae0aa6dadc8ecdd56e3c42063089fbbf545d7ef5f772e151aafd12b1')

package() {
  install -Dm755 "${srcdir}/ixr" "${pkgdir}/usr/bin/ixr"
}
